all:
	uv add ruff
	uv add mlx_lm
	uv run ruff check
	uv run ruff format
	uv run main.py
	uv run mathjax.py
