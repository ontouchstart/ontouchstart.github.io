#[tokio::main] // Marks the async main function
async fn main() -> Result<(), reqwest::Error> {
    let client = reqwest::Client::new();
    let res = client
        .post("http://localhost:8080/v1/chat/completions")
        .body("{\"model\": \"openai/gpt-oss-20b\",\"messages\": [{\"role\": \"user\", \"content\": \"Tell me a joke about Rust.\"}]}")
        .send()
        .await?;

    // Get the response status
    // println!("Status: {}", res.status());

    // Read the body of the response as text
    let body = res.text().await?;
    println!("{}", body);

    Ok(())
}
