/// https://doc.rust-lang.org/stable/book/ch03-01-variables-and-mutability.html#shadowing
#[test]
fn shadowing() {
    let x = 5;

    let x = x + 1;

    {
        let x = x * 2;
        assert_eq!(x, 12);
    }

    assert_eq!(x, 6);
}
