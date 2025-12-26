all:
	uv add ruff pytest
	uv run ruff check
	uv run ruff format
	uv build
