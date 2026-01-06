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
