`make test`

`main.py`
```python
import ontouchstart

name = "notebook-2026-01-06"


def url():
    return "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def test_url():
    assert url() == "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def test_ontouchstart_url():
    assert (
        ontouchstart.url()
        == "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_06_py"
    )


def main():
    print("Hello, world!")
    print(url())
    print(ontouchstart.url())


if __name__ == "__main__":
    main()
```
```bash
uv run pytest main.py -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/rust-notebook/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/06
configfile: pyproject.toml
collecting ... collected 2 items

main.py::test_url PASSED                                                 [ 50%]
main.py::test_ontouchstart_url PASSED                                    [100%]

============================== 2 passed in 0.00s ===============================
```

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
cargo test

running 1 test
test test_url ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```
