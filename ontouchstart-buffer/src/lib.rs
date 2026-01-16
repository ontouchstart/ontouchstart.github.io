#![doc(html_playground_url = "https://play.rust-lang.org/")]
//! This crate has no library, only tests and doc-tests
//! ```
//! use std::io::Write;
//!
//! let mut buffer: Vec<u8> = vec![];
//! assert_eq!(buffer.write_all(b"It works!").unwrap(), ());
//! assert_eq!(buffer.len(), 9);
//! assert_eq!(buffer, b"It works!");
//! ```
//!
#[cfg(test)]
mod tests {
    #[test]
    fn buffer() {
        use std::io::Write;

        let mut buffer: Vec<u8> = vec![];
        assert_eq!(buffer.write_all(b"It works!").unwrap(), ());
        assert_eq!(buffer.len(), 9);
        assert_eq!(buffer, b"It works!");
        assert_eq!(buffer, [73, 116, 32, 119, 111, 114, 107, 115, 33]);
    }
}
