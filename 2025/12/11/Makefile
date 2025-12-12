install:
	uv add ipython ruff
	uv add mlx-lm 
	uv add beautifulsoup4    

repl:
	uv run ipython

ruff:
	uv run ruff check
	uv run ruff format

test:
	echo '# 2025/12/11 The Zen of Python' > README.md
	echo '`uv run main.py`' >> README.md
	echo >> README.md
	uv run main.py >> README.md
