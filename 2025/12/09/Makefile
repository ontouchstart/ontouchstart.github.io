install:
	uv add ipython ruff
	uv add mlx-lm 
	uv add "fastapi[standard]" pydantic
	uv add pytest-playwright

repl:
	uv run ipython

ruff:
	uv run ruff check
	uv run ruff format

explain.md: explain.py
	uv run explain.py > explain.md

main.md: main.py
	uv run explain.py main.py > main.md

server.md: server.py
	uv run explain.py server.py > server.md

test.md: test.py
	uv run explain.py test.py > test.md

server:
	uv run fastapi dev server.py

test:
	uv run pytest test.py

