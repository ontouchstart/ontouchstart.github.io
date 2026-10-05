fn main() {
    println!("Hello, world!");
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use curl::easy::Easy;

    #[test]
    fn test_curl_request() {
        let mut easy = Easy::new();
        easy.url("https://ontouchstart.github.io/").unwrap();
        easy.write_function(|data| {
            // We don't really care about the output in the test, 
            // but we want to ensure it's called and succeeds.
            Ok(data.len())
        }).unwrap();
        easy.perform().unwrap();
    }
}
