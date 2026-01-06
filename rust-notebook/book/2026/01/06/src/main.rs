fn main() {
    println!("Hello, world!");
    println!("{}", url());
}

pub fn url() -> String {
    String::from("https://ontouchstart.github.io/rust-notebook/book/2026/01/06")
}

#[test]
fn it_works() {
    assert_eq!(
        url(),
        String::from("https://ontouchstart.github.io/rust-notebook/book/2026/01/06")
    )
}
