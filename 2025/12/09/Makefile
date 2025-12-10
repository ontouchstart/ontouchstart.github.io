install:
	uv add ipython ruff
	uv add mlx-lm 

repl:
	uv run ipython

ruff:
	uv run ruff check
	uv run ruff format

explain.md: explain.py
	uv run explain.py > explain.md

main.md: main.py
	uv run explain.py main.py > main.md
