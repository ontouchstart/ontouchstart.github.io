# 2025/12/18 Having fun with python packages


```Makefile
install:
	uv add ipython
	uv add ruff
	uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@gist" --no-cache
	uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@ask_mlx_lm" --no-cache


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
