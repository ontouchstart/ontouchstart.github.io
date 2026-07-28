use tokio::net::TcpStream;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use std::env;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let base_url = env::var("LLAMA_BASE_URL").expect("LLAMA_BASE_URL must be set");
    
    // The URL is assumed to be in the format http://host:port/path
    // We need to extract the host:port part and the path part.
    let url_without_scheme = base_url.trim_start_matches("http://").trim_start_matches("https://");
    let (host_port, base_path) = match url_without_scheme.find('/') {
        Some(index) => (&url_without_scheme[..index], &url_without_scheme[index..]),
        None => (url_without_scheme, "/"),
    };

    let address = host_port.to_string();

    let mut stream = TcpStream::connect(&address).await?;

    let chat_path = format!("{}/chat/completions", base_path);

    let body = r#"{"model": "gemma-4-12B-it-Q4_K_M", "messages": [{"role": "user", "content": "Give me a random interger between 1 and 100. Don't use 42."}]}"#;
    let request = format!(
        "POST {} HTTP/1.1\r\nHost: {}\r\nContent-Type: application/json\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{}",
        chat_path, host_port, body.len(), body
    );

    stream.write_all(request.as_bytes()).await?;

    let mut buffer = Vec::new();
    stream.read_to_end(&mut buffer).await?;

    println!("{}", String::from_utf8_lossy(&buffer));
    Ok(())
}
