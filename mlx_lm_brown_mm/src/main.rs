use reqwest::Error;

#[tokio::main] // Marks the async main function
async fn main() -> Result<(), Error> {
    let client = reqwest::Client::new();
    let res = client
        .post("http://localhost:8080/v1/chat/completions")
        .body("{\"model\": \"mlx-community/Llama-3.2-3B-Instruct-4bit\",\"messages\": [{\"role\": \"user\", \"content\": \"Tell me something about brown M&Ms\"}]}")
        .send()
        .await?;

    // Get the response status
    // println!("Status: {}", res.status());

    // Read the body of the response as text
    let body = res.text().await?;
    println!("{}", body);

    Ok(())
}
