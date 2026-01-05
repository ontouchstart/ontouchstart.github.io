all:	develop
	uv run pytest -v
	uv run main.py
	uv run python -m ontouchstart 
	uv run python -m ontouchstart.resume

install:
	uv add maturin pytest ruff mlx_lm
	rm -rf Cargo.lock uv.lock
	# uvx maturin init --mixed --bindings pyo3 --name ontouchstart .

develop: install
	uv run ruff check
	uv run ruff format
	uv run maturin develop

clean:
	rm -rf target .venv .ruff_cache .pytest_cache __pycache__ **/*/*.so **/*/__pycache__

du:
	du -hsc * .*
