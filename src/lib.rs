pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

mod gcd;
pub use gcd::gcd;

mod gcd_from_numbers;
pub use gcd_from_numbers::gcd_from_numbers;

// should pass in ontouchstart_2026_01_14_rs_proptest
// mod parse_date_0;
mod parse_date_1;

// should pass in ontouchstart_2026_01_14_rs_proptest
// pub use parse_date_0::parse_date;
pub use parse_date_1::parse_date;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
