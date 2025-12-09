install:
	uv add ipython ruff
	uv add "fastapi[standard]" pydantic
	uv add pytest-playwright
	uv add mlx-lm 

repl:
	uv run ipython

server:
	uv run fastapi dev server.py

test:
	uv run pytest test.py

ruff:
	uv run ruff check
	uv run ruff format
