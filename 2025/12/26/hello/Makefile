all:
	uv add ruff maturin pytest 
	uv run ruff check
	uv run ruff format
	uv run maturin dev
	uv run pytest -v
	uv run maturin build
