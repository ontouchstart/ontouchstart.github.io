install:
	uv add ruff
	uv add mlx_lm
	uv add openai

ruff:
	uv run ruff check
	uv run ruff format

server:
	uv run mlx_lm.server

build:
	echo "# 2025/12/16 Learn Names"  > README.md
	echo '```python' >> README.md
	cat -n learn-names.py >> README.md
	echo '```' >> README.md
	echo '```uv run learn-names.py```' >> README.md
	echo '```' >> README.md
	uv run learn-names.py >> README.md
	echo '```' >> README.md

