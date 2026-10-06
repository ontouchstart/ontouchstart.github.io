use reqwest;
use serde_json;

#[tokio::test]
async fn test_check_llama_cpp_server_models() {
    let base_url = "http://host.docker.internal:8080/v1";
    println!("Checking models at {}", base_url);

    match reqwest::get(format!("{}/models", base_url)).await {
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
