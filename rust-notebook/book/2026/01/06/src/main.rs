fn main() {
    println!("Hello, world!");
    println!("{}", url());
    println!("{}", ontouchstart_2026_01_06_rs::url());
}

pub fn url() -> String {
    String::from("https://ontouchstart.github.io/rust-notebook/book/2026/01/06")
}

#[test]
fn test_url() {
    assert_eq!(
        url(),
        String::from("https://ontouchstart.github.io/rust-notebook/book/2026/01/06")
    )
}

#[test]
fn test_ontouchstart_url() {
    assert_eq!(
        ontouchstart_2026_01_06_rs::url(),
        String::from("https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_06_rs")
    )
}
