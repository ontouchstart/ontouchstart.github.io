/// Integration tests
#[cfg(test)]
mod tests {

    /// Integration tests for the default `add` fn from local crate
    #[test]
    fn it_works_local_crate() {
        use ontouchstart_2026_01_15_rs_test::add;
        let result = add(2, 2);
        assert_eq!(result, 4);
    }

    /// Integration tests for the default `add` fn from remote crate
    #[test]
    fn it_works_remote_crate() {
        use ontouchstart_2026_01_15_rs::add;
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
