pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }

    #[test]
    fn test_ontouchstart_buffer_it_works() {
        use ontouchstart_buffer::it_works;
        assert_eq!(it_works(), b"It works!");
    }
}
