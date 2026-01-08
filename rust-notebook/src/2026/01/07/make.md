`Makefile`
```Makefile
NAME=notebook_2026_01_07

all:	make.md Cargo.md test.md 

server:
	uv run mlx_lm.server

make.md:	Makefile
	echo '`Makefile`' > make.md
	echo '```Makefile' >> make.md
	cat Makefile >> make.md
	echo '```' >> make.md

Cargo.md:	Cargo.toml
	echo '`Cargo.toml`' > Cargo.md
	echo '```toml' >> Cargo.md
	cat Cargo.toml >> Cargo.md
	echo '```' >> Cargo.md

test.md:
	make test &> test.md

Cargo.toml:
	cargo init --name $(NAME) .
	cargo add fst --features levenshtein

fmt:
	cargo fmt

test:	Cargo.toml fmt
	@echo '`make test`'

	@echo
	@echo '`src/main.rs`'
	@echo '```rust'
	@cat src/main.rs
	@echo '```'

	@echo
	@echo '`src/lib.rs`'
	@echo '```rust'
	@cat src/lib.rs
	@echo '```'

	@echo
	@echo '`tests/integration_test.rs`'
	@echo '```rust'
	@cat tests/integration_test.rs
	@echo '```'

	@echo
	@echo '`tests/fst-test.rs`'
	@echo '```rust'
	@cat tests/fst-test.rs
	@echo '```'

	@echo
	@echo '`tests/example-fuzzy-query.rs`'
	@echo '```rust'
	@cat tests/example-fuzzy-query.rs
	@echo '```'

	@echo
	@echo '`tests/example-searching-multiple-sets-efficiently.rs`'
	@echo '```rust'
	@cat tests/example-searching-multiple-sets-efficiently.rs
	@echo '```'

	@echo '```bash'
	cargo test
	@echo '```'

clean:
	rm -f *.toml test.md
```
