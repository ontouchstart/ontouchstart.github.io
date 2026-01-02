all:	Cargo.toml pyproject.toml
	uv run main.py
	cargo run

Cargo.toml:
	cargo init .

pyproject.toml:
	uv init .

.gitignore:
	curl -sL https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Python.gitignore > .gitignore

clean:
	rm -f *.toml .gitignore
