install:
	uv add "fastapi[standard]"
	uv add mlx-lm pytest-playwright
	uv run main.py

server:
	uv run fastapi dev server.py

test:
	uv run pytest test.py
