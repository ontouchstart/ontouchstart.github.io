`Cargo.toml`
```toml
[package]
name = "notebook_2026_01_06"
version = "0.1.0"
edition = "2024"

[dependencies]
```
`pyproject.toml`
```toml
[project]
name = "notebook-2026-01-06"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.14"
dependencies = [
    "mlx-lm>=0.29.1",
    "pytest>=9.0.2",
]
```
`Makefile`
```Makefile
NAME=notebook_2026_01_06

all:	Cargo.toml pyproject.toml
	@echo '`Cargo.toml`' > make.md
	@echo '```toml' >> make.md
	@cat Cargo.toml >> make.md
	@echo '```' >> make.md

	@echo '`pyproject.toml`' >> make.md
	@echo '```toml' >> make.md
	@cat pyproject.toml >> make.md
	@echo '```' >> make.md

	@echo '`Makefile`' >> make.md
	@echo '```Makefile' >> make.md
	@cat Makefile >> make.md
	@echo '```' >> make.md

	@make test >> make.md

	@make run >> make.md

Cargo.toml:
	cargo init --name $(NAME) .

pyproject.toml:
	uv init --name $(NAME) .
	uv add pytest

test:	Cargo.toml pyproject.toml
	@echo '`make test`'
	@echo
	@echo '`main.py`'
	@echo '```python'
	@cat main.py
	@echo '```'

	@echo '```bash'
	uv run pytest main.py -v
	@echo '```'

	@echo
	@echo '`src/main.rs`'
	@echo '```rust'
	cat src/main.rs 
	@echo '```'

	@echo '```bash'
	cargo test
	@echo '```'

run:	Cargo.toml pyproject.toml
	@echo '`make run`'
	@echo
	@echo '`src/main.rs`'
	@echo '```rust'
	cat src/main.rs 
	@echo '```'
	@echo '```bash'
	cargo run
	@echo '```'

	@echo '`main.py`'
	@echo '```python'
	@cat main.py
	@echo '```'
	@echo '```bash'
	uv run main.py
	@echo '```'

	@echo '```bash'
	@echo '# someone will get the joke, I would not explain'
	uv run mlx_lm.generate --prompt "Tell me something about brown M&Ms"
	@echo '```'

format:
	uv run ruff format
	cargo fmt
clean:
	rm *.toml
```
`make test`

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
uv run pytest main.py -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/rust-notebook/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/06
configfile: pyproject.toml
collecting ... collected 1 item

main.py::test_url PASSED                                                 [100%]

============================== 1 passed in 0.00s ===============================
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
Prompt: 43 tokens, 286.711 tokens-per-sec
Generation: 100 tokens, 47.782 tokens-per-sec
Peak memory: 1.918 GB
```
