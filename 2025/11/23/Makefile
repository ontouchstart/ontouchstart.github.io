all:
	uv add mlx_lm
	echo "# 2025/11/23" > README.md
	echo "main.py" >> README.md
	echo '```' >> README.md
	cat -n main.py >> README.md
	echo '```' >> README.md
	uv run main.py >> README.md
