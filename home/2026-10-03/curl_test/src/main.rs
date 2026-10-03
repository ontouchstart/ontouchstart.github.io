use curl;
use std::sync::{Arc, Mutex};
use curl::easy::List;

#[test]
fn test_versions() {
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
    println!("Response body length: {}", body.len());

    assert_eq!(response_code, 200);
}

#[test]
fn test_curl_headers() {
    let mut handle = curl::easy::Easy::new();
    handle.url("https://httpbin.org/headers").expect("Failed to set URL");

    let mut headers = List::new();
    headers.append("User-Agent: Rust-Curl-Test").expect("Failed to append header");
    handle.http_headers(headers).expect("Failed to set http_headers");

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
    assert!(String::from_utf8_lossy(&body).contains("Rust-Curl-Test"));
}

#[test]
fn test_curl_post() {
    let mut handle = curl::easy::Easy::new();
    handle.url("https://httpbin.org/post").expect("Failed to set URL");

    let mut form = curl::easy::Form::new();
    let mut part1 = form.part("name");
    part1.contents(b"rust_test");
    part1.add().expect("Failed to add part1");

    let mut part2 = form.part("value");
    part2.contents(b"123");
    part2.add().expect("Failed to add part2");

    handle.httppost(form).expect("Failed to set httppost");

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
    assert!(String::from_utf8_lossy(&body).contains("rust_test"));
}

fn main() {
    println!("Hello, world!");
}
