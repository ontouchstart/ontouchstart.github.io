all:	pyproject.toml
	uv add mlx mlx_lm
	uv add ruff pytest
	uv run ruff check
	uv run ruff format
	uv build

pyproject.toml:
	uv init --package --name ask_mlx_lm
