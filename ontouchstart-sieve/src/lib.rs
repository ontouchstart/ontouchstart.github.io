#![doc(html_playground_url = "https://play.rust-lang.org/")]
//! This should work in the playground.
//!
//! ```
//! let mut sieve = [true; 4_000_000];
//! for i in 2..2_000 {
//!     if sieve[i] {
//!         let mut j = i * i;
//!         while j < 4_000_000 {
//!             sieve[j] = false;
//!             j += i;
//!         }
//!     }
//! }
//! for i in 2..1_000 {
//!     if sieve[i] {
//!         println!("prime: {}", i);
//!     }
//! }
//! for i in 1..1_000 {
//!     if sieve[4_000_000 - i] {
//!         println!("prime: {}", 4_000_000 - i);
//!     }
//! }
//!
//! ```
//!

pub fn sieve() -> [bool; 10_000] {
    let mut sieve = [true; 10_000];
    for i in 2..100 {
        if sieve[i] {
            let mut j = i * i;
            while j < 10_000 {
                sieve[j] = false;
                j += i;
            }
        }
    }
    sieve
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert!(sieve()[211]);
        assert!(!sieve()[9876]);
    }
}
