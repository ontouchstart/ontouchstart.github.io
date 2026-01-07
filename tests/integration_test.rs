#[cfg(test)]
mod tests {
    #[test]
    fn test_url() {
        assert_eq!(
            ontouchstart_2026_01_07_rs::url(),
            String::from(
                "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_07_rs"
            )
        );
    }
}
