install:
	uv add ipython ruff
	uv add requests
	uv add mlx_lm

build:
	echo "# 2025/12/13" > README.md
	echo '`uv run ask_time.py`' >> README.md
	uv run ask_time.py > README.md
