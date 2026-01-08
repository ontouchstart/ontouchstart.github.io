/// https://doc.rust-lang.org/stable/book/ch03-02-data-types.html
#[test]
fn string_parse_test() {
    let x: u32 = "42".parse().expect("Not a number!");
    assert_eq!(x, 42);
}
