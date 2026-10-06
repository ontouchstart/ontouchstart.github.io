use reqwest;
use serde_json;

#[tokio::test]
async fn test_check_llama_cpp_server_chat_completions() {
    let base_url = "http://host.docker.internal:8080/v1";
    println!("Checking chat completions at {}", base_url);

    let client = reqwest::Client::new();
    let body = serde_json::json!({
        "model": "models/gemma-4-12B-it-Q8_0.gguf",
        "messages": [
            {
                "role": "user",
                "content": "Hello!"
            }
        ],
        "max_tokens": 10
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
        }
        Err(e) => {
            println!("Error connecting to server: {}", e);
        }
    }
}
