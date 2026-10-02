use rusqlite::{Connection, Result};
use curl;
use openssl;

#[test]
fn test_versions() {
    let conn = Connection::open_in_memory().expect("Failed to open in-memory database");
    let sqlite_version: String = conn.query_row("SELECT sqlite_version()", [], |row| row.get(0))
        .expect("Failed to get sqlite version");
    println!("SQLite version: {}", sqlite_version);
    println!("curl is available");
    println!("openssl is available");
}

fn main() {
    println!("Hello, world!");
}
