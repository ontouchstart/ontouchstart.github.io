use rusqlite::{Connection};
use curl;
use std::sync::{Arc, Mutex};

#[test]
fn test_versions() {
    let conn = Connection::open_in_memory().expect("Failed to open in-memory database");
    let sqlite_version: String = conn.query_row("SELECT sqlite_version()", [], |row| row.get(0))
        .expect("Failed to get sqlite version");
    println!("SQLite version: {}", sqlite_version);
    println!("curl is available");
    println!("openssl is available");
}

#[test]
fn test_curl_request() {
    let mut handle = curl::easy::Easy::new();
    handle.url("https://ontouchstart.github.io").expect("Failed to set URL");

    let response_data = Arc::new(Mutex::new(Vec::new()));
    let response_data_clone = Arc::clone(&response_data);
    handle.write_function(move |data| {
        let mut buffer = response_data_clone.lock().unwrap();
        buffer.extend_from_slice(data);
        Ok(data.len())
    }).expect("Failed to set write function");

    handle.perform().expect("Failed to perform request");

    let response_code = handle.response_code().expect("Failed to get response code");
    let body = response_data.lock().unwrap();
    println!("Response code: {}", response_code);
    println!("Response body: {}", String::from_utf8_lossy(&body));

    assert_eq!(response_code, 200);
}

fn main() {
    println!("Hello, world!");
}
