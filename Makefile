all:
	# uvx maturin init --mixed --bindings pyo3 --name ontouchstart .
	uv add maturin pytest ruff
	uv run ruff check
	uv run ruff format
	uv run maturin build
	uv run pytest -v
	uv run main.py
	uv run python -m ontouchstart 
	uv run python -m ontouchstart.resume

