use reqwest;
use serde_json;

#[tokio::test]
async fn test_check_llama_cpp_server_chat_complex() {
    let base_url = "http://host.docker.internal:8080/v1";
    println!("Checking complex chat at {}", base_url);

    let client = reqwest::Client::new();
    let body = serde_json::json!({
        "model": "models/gemma-4-12B-it-Q8_0.gguf",
        "messages": [
            {
                "role": "user",
                "content": "What is the capital of France?"
            }
        ],
        "max_tokens": 50
    });

    match client.post(format!("{}/chat/completions", base_url))
        .json(&body)
        .send()
        .await {
        Ok(res) => {
            let status = res.status();
            let data: serde_json::Value = res.json().await.unwrap_or_default();
            println!("Response Status: {}", status);
            println!("Response Data: {}", serde_json::to_string_pretty(&data).unwrap_or_default());

            if let Some(choices) = data.get("choices").and_then(|c| c.as_array()) {
                if let Some(choice) = choices.get(0).and_then(|c| c.as_object()) {
                    if let Some(message) = choice.get("message").and_then(|m| m.as_object()) {
                        if let Some(content) = message.get("content").and_then(|c| c.as_str()) {
                            println!("Success: Received content: {}", content);
                        } else {
                            println!("Warning: Received content is empty, but reasoning might be present.");
                            if let Some(reasoning) = message.get("reasoning_content").and_then(|r| r.as_str()) {
                                println!("Reasoning content: {}", reasoning);
                            }
                        }
                    }
                }
            }
        }
        Err(e) => {
            println!("Error connecting to server: {}", e);
        }
    }
}
