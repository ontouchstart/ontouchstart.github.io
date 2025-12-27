all: 	test

pyproject.toml:
	uvx maturin init --mixed --bindings pyo3 --name hello_maturin .
	uv add maturin pytest ruff

build:  Cargo.toml 
	uv build

test:	pyproject.toml
	uv run pytest -v

clean:
	rm *.toml
