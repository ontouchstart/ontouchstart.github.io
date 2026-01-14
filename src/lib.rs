pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

mod parse_date_0;
// mod parse_date_1;

pub use parse_date_0::parse_date;
// pub use parse_date_1::parse_date;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
