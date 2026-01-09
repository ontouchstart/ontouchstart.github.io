/// ```
/// assert_eq!(rust_tests::add(2, 2), 4);
/// ```
pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

mod largest;

pub use largest::largest;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }

    #[test]
    fn test_largest() {
        let number_list = vec![34, 50, 25, 100, 65];

        let result = largest(&number_list);
        assert_eq!(*result, 100);

        let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

        let result = largest(&number_list);
        assert_eq!(*result, 6000);
    }
}
