`make run`

`src/main.rs`
```rust
cat src/main.rs 
fn main() {
    println!("Hello, world!");
    println!("{}", url());
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
```
```bash
cargo run
Hello, world!
https://ontouchstart.github.io/rust-notebook/book/2026/01/06
```
`main.py`
```python
name = "notebook-2026-01-06"


def url():
    return "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def test_url():
    assert url() == "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def main():
    print("Hello, world!")
    print(url())


if __name__ == "__main__":
    main()
```
```bash
uv run main.py
Hello, world!
https://ontouchstart.github.io/rust-notebook/book/2026/01/06
```
```bash
# someone will get the joke, I would not explain
uv run mlx_lm.generate --prompt "Tell me something about brown M&Ms"
==========
Brown M&M's are a unique and interesting variation of the classic candy. They were first introduced in the United States in 1995 as a limited-edition flavor. The brown M&M's were made with a caramel-like coating, which gave them a distinct taste and texture.

Interestingly, the brown M&M's were not an instant success. In fact, they were met with skepticism by many people, who were used to the traditional milk chocolate and colorful candy shell of the classic M&M's.
==========
Prompt: 43 tokens, 347.386 tokens-per-sec
Generation: 100 tokens, 47.532 tokens-per-sec
Peak memory: 1.911 GB
```
