NAME=notebook_2026_01_06

all:	Cargo.toml pyproject.toml
	@echo "# $(NAME)" > README.md

	@echo '`Cargo.toml`' >> README.md
	@echo '```toml' >> README.md
	@cat Cargo.toml >> README.md
	@echo '```' >> README.md

	@echo '`pyproject.toml`' >> README.md
	@echo '```toml' >> README.md
	@cat pyproject.toml >> README.md
	@echo '```' >> README.md

	@echo '`Makefile`' >> README.md
	@echo '```Makefile' >> README.md
	@cat Makefile >> README.md
	@echo '```' >> README.md

	@make test >> README.md

	@make run >> README.md

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
	uv run mlx_lm.generate --prompt "Tell me something about brown M&Ms"
	@echo '```'

format:
	uv run ruff format
	cargo fmt
clean:
	rm *.toml
