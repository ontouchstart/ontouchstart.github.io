all:	
	uv add pytest ruff
	uv run ruff check
	uv run ruff format
	uv run pytest main.py -v
	uv run main.py
