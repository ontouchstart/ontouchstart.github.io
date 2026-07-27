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
    println!("Connecting to {}", address);

    let endpoints = ["health", "models"];

    for endpoint in endpoints {
        println!("--- Requesting /v1/{}/ ---", endpoint);
        let mut stream = TcpStream::connect(&address).await?;

        // Since base_path already contains /v1, we just append /health and /models
        // and ensure we don't have double slashes.
        let full_path = if base_path.ends_with('/') {
            format!("{}{}", base_path, endpoint)
        } else {
            format!("{}/{}", base_path, endpoint)
        };

        let request = format!(
            "GET {} HTTP/1.1\r\nHost: {}\r\nConnection: close\r\n\r\n",
            full_path, host_port
        );

        stream.write_all(request.as_bytes()).await?;

        let mut buffer = Vec::new();
        stream.read_to_end(&mut buffer).await?;

        println!("{}", String::from_utf8_lossy(&buffer));
        println!();
    }

    Ok(())
}
