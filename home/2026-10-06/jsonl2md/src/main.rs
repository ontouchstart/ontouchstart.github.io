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
        output.push_str(&format!("## Entry {}\n", id));
        
        for (key, value) in obj {
            output.push_str(&format_kv_pair(key, value));
        }
        
        output.push_str("---\n\n");
    }
    
    output
}

fn format_kv_pair(key: &str, value: &Value) -> String {
    if key == "message" {
        format_message(key, value)
    } else if value.is_object() || value.is_array() {
        format!("**{}**: \n```json\n{}```\n\n", key, serde_json::to_string_pretty(value).unwrap())
    } else {
        let val_str = match value {
            Value::String(s) => s.clone(),
            Value::Number(n) => n.to_string(),
            Value::Bool(b) => b.to_string(),
            Value::Null => "null".to_string(),
            _ => serde_json::to_string(value).unwrap(),
        };
        format!("**{}**: {}\n\n", key, val_str)
    }
}

fn format_message(key: &str, value: &Value) -> String {
    if let Some(msg_obj) = value.as_object() {
        if msg_obj.contains_key("content") {
            let role = msg_obj.get("role").and_then(|r| r.as_str()).unwrap_or("unknown");
            let mut output = format!("**Role**: {}\n\n", role);
            
            if let Some(content) = msg_obj.get("content").and_then(|c| c.as_array()) {
                for part in content {
                    if let Some(p_obj) = part.as_object() {
                        match p_obj.get("type").and_then(|t| t.as_str()) {
                            Some("thinking") => {
                                let thinking = p_obj.get("thinking").and_then(|t| t.as_str()).unwrap_or("");
                                output.push_str("> **Thinking**: \n> ");
                                output.push_str(thinking);
                                output.push_str("\n\n");
                            }
                            Some("text") => {
                                let text = p_obj.get("text").and_then(|t| t.as_str()).unwrap_or("");
                                output.push_str(text);
                                output.push_str("\n\n");
                            }
                            _ => {}
                        }
                    }
                }
            }
            output
        } else if let Some(msg_str) = value.as_str() {
            format!("**{}**: \n{}\n\n", key, msg_str)
        } else {
            format!("**{}**: \n{}\n\n", key, serde_json::to_string_pretty(value).unwrap())
        }
    } else if let Some(msg_str) = value.as_str() {
        format!("**{}**: \n{}\n\n", key, msg_str)
    } else {
        format!("**{}**: \n{}\n\n", key, serde_json::to_string_pretty(value).unwrap())
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
        assert!(result.contains("**key**: value"));
    }

    #[test]
    fn test_format_kv_pair_simple() {
        let result = format_kv_pair("key", &json!("value"));
        assert_eq!(result, "**key**: value\n\n");
    }

    #[test]
    fn test_format_kv_pair_object() {
        let result = format_kv_pair("key", &json!({"a": 1}));
        assert!(result.contains("```json"));
        assert!(result.contains("\"a\": 1"));
    }

    #[test]
    fn test_format_message_simple() {
        let result = format_message("message", &json!("hello"));
        assert_eq!(result, "**message**: \nhello\n\n");
    }

    #[test]
    fn test_format_message_complex() {
        let data = json!({
            "role": "assistant",
            "content": [
                { "type": "thinking", "thinking": "thinking content" },
                { "type": "text", "text": "actual content" }
            ]
        });
        let result = format_message("message", &data);
        assert!(result.contains("**Role**: assistant"));
        assert!(result.contains("> **Thinking**: \n> thinking content"));
        assert!(result.contains("actual content"));
    }
}
