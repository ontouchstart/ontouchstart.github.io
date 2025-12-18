install:
	uv add ipython
	uv add ruff
	uv add "git+https://github.com/ontouchstart/mlx-lm@main"
	uv add "git+https://github.com/ontouchstart/openai-python"

ruff:
	uv run ruff check
	uv run ruff format

server:
	uv run mlx_lm.server --max-tokens 1024 --log-level DEBUG

repl:
	uv run ipython

joke.md: joke.py
	uv run joke.py > joke.md
