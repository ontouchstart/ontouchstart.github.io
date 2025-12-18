install:
	uv add ipython
	uv add ruff
	uv add mlx_lm openai

ruff:
	uv run ruff check
	uv run ruff format

server:
	uv run mlx_lm.server --max-tokens 1024 --log-level DEBUG

repl:
	uv run ipython

joke.md: joke.py
	uv run joke.py > joke.md
