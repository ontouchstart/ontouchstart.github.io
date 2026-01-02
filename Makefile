all:	Cargo.toml pyproject.toml
	uv run ruff check
	uv run ruff format
	uv run main.py
	uv run resume.py
	cargo fmt -v
	cargo run --bin resume

Cargo.toml:
	cargo init .

pyproject.toml:
	uv init .
	uv add ruff

.gitignore:
	curl -sL https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Python.gitignore > .gitignore

clean:
	rm -f *.toml .gitignore
