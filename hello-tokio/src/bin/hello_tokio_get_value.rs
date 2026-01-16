//! # hello-tokio
//!
//! get_value variation of
//!
//! <https://github.com/tokio-rs/website/blob/master/content/tokio/tutorial/hello-tokio.md>
//!
//!
use mini_redis::{Result, client};
use std::env;

#[tokio::main]
async fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} key", &args[0]);
        std::process::exit(1);
    }

    let key = &args[1];

    // Open a connection to the mini-redis address.
    let mut client = client::connect("127.0.0.1:6379").await?;

    // Get value for key
    let result = client.get(key).await?;

    println!("key={}, value={:#?}", key, result);

    Ok(())
}
