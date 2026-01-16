#![doc(html_playground_url = "https://play.rust-lang.org/")]
//! This crate has no library, only tests and doc-tests
//! ```
//! use std::io::Write;
//!
//! let mut buffer: Vec<u8> = vec![];
//! assert_eq!(buffer.write_all(b"It works!").unwrap(), ());
//! assert_eq!(buffer.len(), 9);
//! assert_eq!(buffer, b"It works!");
//! assert_eq!(buffer, [73, 116, 32, 119, 111, 114, 107, 115, 33]);
//! ```
//!

#![doc(html_playground_url = "")]
///
/// Following code depends on the crate `ontouchstart_buffer`
/// so we can't run it in the playground.
/// You can copy and paste to your code.
/// ```
/// use ontouchstart_buffer::it_works;
/// assert_eq!(it_works(), b"It works!");
/// ```
///
pub fn it_works() -> Vec<u8> {
    use std::io::Write;
    let mut buffer: Vec<u8> = vec![];
    let _ = buffer.write_all(b"It works!");
    buffer
}

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

    #[test]
    fn test_it_works() {
        use crate::it_works;
        assert_eq!(it_works(), b"It works!");
    }
}
