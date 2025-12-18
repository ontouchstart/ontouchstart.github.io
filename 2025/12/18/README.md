# 2025/12/18 import wrapped python packages from github repo

```Makefile
install:
	uv add ipython
	uv add ruff
	uv add "git+https://github.com/ontouchstart/openai-python" --no-cache
	uv add "git+https://github.com/ontouchstart/theoretical-and-practical-ml-ideas" --no-cache

ruff:
	uv run ruff check
	uv run ruff format

server:
	uv run mlx_lm.server --max-tokens 1024 --log-level DEBUG

repl:
	uv run ipython

joke.md: joke.py
	uv run joke.py > joke.md

learn-names.md: learn-names.py
	uv run learn-names.py > learn-names.md
```

- [joke.py](joke.py)
- [joke](joke)

- [learn-names.py](learn-names.py)
- [learn-names](learn-names)
