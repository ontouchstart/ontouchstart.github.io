use serde_json::Value;
use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    for line in stdin.lock().lines() {
        let line = match line {
            Ok(l) => l,
            Err(_) => continue,
        };
        let trimmed = line.trim();
        if trimmed.is_empty() {
            continue;
        }

        match serde_json::from_str::<Value>(trimmed) {
            Ok(data) => {
                let output = format_entry(&data);
                println!("{}", output);
            }
            Err(_) => {
                let preview = if trimmed.len() > 50 { &trimmed[..50] } else { trimmed };
                eprintln!("Skipping invalid JSON line: {}...", preview);
            }
        }
    }
}

fn format_entry(data: &Value) -> String {
    let mut output = String::new();
    
    if let Some(obj) = data.as_object() {
        let id = obj.get("id").and_then(|v| v.as_str()).unwrap_or("N/A");
        output.push_str(&format!("## Entry {}\n\n", id));
        
        output.push_str(&format_value(data, 0));
        
        output.push_str("---\n\n");
    }
    
    output
}

fn format_value(value: &Value, indent: usize) -> String {
    let header_level = 3 + indent;
    match value {
        Value::Object(map) => {
            let mut output = String::new();
            let mut keys: Vec<_> = map.keys().collect();
            keys.sort();
            for key in keys {
                let val = &map[key];
                output.push_str(&format!("{} {}\n\n", "#".repeat(header_level), key));
                if val.is_object() || val.is_array() {
                    output.push_str(&format_value(val, indent + 1));
                    output.push_str("\n\n");
                } else {
                    output.push_str(&format_leaf(val));
                    output.push_str("\n\n");
                }
            }
            output
        }
        Value::Array(arr) => {
            let mut output = String::new();
            for (i, val) in arr.iter().enumerate() {
                output.push_str(&format!("[] {}\n\n", i));
                if val.is_object() || val.is_array() {
                    output.push_str(&format_value(val, indent + 1));
                } else {
                    output.push_str(&format_leaf(val));
                    output.push_str("\n\n");
                }
            }
            output
        }
        _ => format_leaf(value),
    }
}

fn format_leaf(value: &Value) -> String {
    match value {
        Value::String(s) => s.clone(),
        Value::Number(n) => n.to_string(),
        Value::Bool(b) => b.to_string(),
        Value::Null => "null".to_string(),
        _ => serde_json::to_string(value).unwrap(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn test_format_entry_basic() {
        let data = json!({
            "id": "123",
            "key": "value"
        });
        let result = format_entry(&data);
        assert!(result.contains("## Entry 123"));
        assert!(result.contains("### id"));
        assert!(result.contains("### key"));
    }

    #[test]
    fn test_format_value_recursive() {
        let data = json!({
            "a": {
                "b": 1
            },
            "c": [2, 3]
        });
        let result = format_value(&data, 0);
        assert!(result.contains("### a"));
        assert!(result.contains("#### b"));
        assert!(result.contains("### c"));
        assert!(result.contains("[] 0"));
        assert!(result.contains("[] 1"));
    }

    #[test]
    fn test_format_leaf() {
        assert_eq!(format_leaf(&json!("hello")), "hello");
        assert_eq!(format_leaf(&json!(42)), "42");
        assert_eq!(format_leaf(&json!(true)), "true");
        assert_eq!(format_leaf(&json!(null)), "null");
    }
}
