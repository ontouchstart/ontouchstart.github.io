all:	install ruff build
	
install:
	uv add ruff

ruff:
	uv run ruff check
	uv run ruff format

build:
	uv run main.py

