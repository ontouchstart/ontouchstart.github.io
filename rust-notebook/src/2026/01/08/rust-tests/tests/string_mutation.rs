/// https://doc.rust-lang.org/stable/book/ch04-01-what-is-ownership.html#the-string-type
#[test]
fn string_mutation() {
    let mut s = String::from("hello");

    s.push_str(", world!"); // push_str() appends a literal to a String

    assert_eq!(s, "hello, world!");
}
