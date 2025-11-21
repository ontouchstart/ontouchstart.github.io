all:
	uv add mlx_lm
	echo "# pipe-v0.py" > README.md
	cat pipe-v0.py | uv run pipe-v0.py >> README.md
	echo "# pipe-v1.py" >> README.md
	cat pipe-v1.py | uv run pipe-v1.py >> README.md
	echo "# pipe-v2.py" >> README.md
	cat pipe-v2.py | uv run pipe-v2.py >> README.md
