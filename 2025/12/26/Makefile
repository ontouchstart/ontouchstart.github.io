all:
	rm -f uv.lock
	uv add ruff pytest 
	uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@hello_maturin" --no-cache
	uv run ruff check
	uv run ruff format
	uv run main.py
	uv run pytest  -v
	
