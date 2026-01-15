use mini_redis::{Result, client};
use std::env;

#[tokio::main]
/// # hello-tokio
///
/// <https://github.com/tokio-rs/website/blob/master/content/tokio/tutorial/hello-tokio.md>
///

async fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 3 {
        eprintln!("Usage: {} key value", &args[0]);
        std::process::exit(1);
    }

    let key = &args[1];
    let value = &args[2];

    // Open a connection to the mini-redis address.
    let mut client = client::connect("127.0.0.1:6379").await?;

    client.set(key, value.to_string().into()).await?;

    println!("set: key={}, value={}", key, value);

    Ok(())
}
