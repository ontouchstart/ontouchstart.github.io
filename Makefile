all: 	clean test build
	uv run main.py

pyproject.toml:
	uvx maturin init --mixed --bindings pyo3 --name hello_maturin .
	uv add maturin pytest ruff

build:  Cargo.toml 
	uv run maturin build

test:	pyproject.toml
	uv run pytest -v

clean:
	rm -rf *.toml target dist .venv
