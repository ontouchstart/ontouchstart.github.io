use reqwest::Error;

#[tokio::main] // Marks the async main function
async fn main() -> Result<(), Error> {
    // Perform the GET request
    let res = reqwest::get("http://localhost:8080/v1/models").await?;

    // Get the response status
    // println!("Status: {}", res.status());

    // Read the body of the response as text
    let body = res.text().await?;
    println!("{}", body);

    Ok(())
}
