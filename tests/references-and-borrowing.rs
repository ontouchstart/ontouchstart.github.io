///
/// https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
///
#[cfg(test)]
mod tests {
    fn calculate_length(s: &String) -> usize {
        s.len()
    }

    fn change(some_string: &mut String) {
        some_string.push_str(", world");
    }

    #[test]
    fn test_calculate_length() {
        let s1 = String::from("hello");
        assert_eq!(s1.len(), 5);

        let len = calculate_length(&s1);
        assert_eq!(len, 5);

        assert_eq!(len, s1.len());
        assert_eq!(
            format!("The length of '{s1}' is {len}."),
            "The length of 'hello' is 5."
        );
    }

    #[test]
    fn test_change_length() {
        let mut s2 = String::from("hello");
        change(&mut s2);
        assert_eq!(s2, String::from("hello, world"));
    }

    #[test]
    fn test_mutable_scope() {
        let mut s = String::from("hello");
        assert_eq!(format!("{s}"), "hello");

        {
            let r1 = &mut s;
            assert_eq!(format!("{r1}"), "hello");
            r1.push_str(", world");
            assert_eq!(format!("{r1}"), "hello, world");
            assert_eq!(format!("{s}"), "hello, world");
        } // r1 goes out of scope here, so we can make a new reference with no problems.

        let r2 = &mut s;
        assert_eq!(format!("{r2}"), "hello, world");
        assert_eq!(format!("{s}"), "hello, world");
    }
}
