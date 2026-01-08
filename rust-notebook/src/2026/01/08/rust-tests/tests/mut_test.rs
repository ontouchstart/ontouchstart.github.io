/// https://doc.rust-lang.org/stable/book/ch03-01-variables-and-mutability.html
#[test]
fn mut_test() {
    let mut x = 5;
    assert_eq!(x, 5);
    x = 6;
    assert_eq!(x, 6);
}
