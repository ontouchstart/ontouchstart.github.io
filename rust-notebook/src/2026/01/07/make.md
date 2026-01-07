`Makefile`
```Makefile
NAME=notebook_2026_01_07

all:	make.md Cargo.md pyproject.md test.md run.md

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

pyproject.md:	pyproject.toml
	echo '`pyproject.toml`' > pyproject.md
	echo '```toml' >> pyproject.md
	cat pyproject.toml >> pyproject.md
	echo '```' >> pyproject.md

test.md:
	make test > test.md

run.md:
	make run > run.md

Cargo.toml:
	cargo init --name $(NAME) .
	cargo add fst --features levenshtein

pyproject.toml:
	uv init --name $(NAME) .
	uv add pytest

test:	Cargo.toml pyproject.toml
	@echo '`make test`'

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

	# python
	@echo
	@echo '`main.py`'
	@echo '```python'
	@cat main.py
	@echo '```'

	@echo '```bash'
	uv run pytest main.py -v
	@echo '```'

run:	Cargo.toml pyproject.toml
	@echo '`make run`'

	# rust
	@echo
	@echo '`src/main.rs`'
	@echo '```rust'
	@cat src/main.rs 
	@echo '```'
	@echo '```bash'
	cargo run
	@echo '```'

	# python
	@echo '`main.py`'
	@echo '```python'
	@cat main.py
	@echo '```'
	@echo '```bash'
	uv run main.py
	@echo '```'

format:
	uv run ruff format
	cargo fmt
clean:
	rm -f *.toml run.md test.md
```
