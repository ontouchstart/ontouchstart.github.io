install:
	uv add ipython
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
	echo '[learn-names.py](learn-names.py)' >> README.md
	echo '```python' >> README.md
	cat -n learn-names.py >> README.md
	echo '```' >> README.md
	echo '```uv run learn-names.py```' >> README.md
	echo '```' >> README.md
	uv run learn-names.py >> README.md
	echo '```' >> README.md

	echo '[learn-names-openai.py](learn-names-openai.py)' >> README.md
	echo '```python' >> README.md
	cat -n learn-names-openai.py >> README.md
	echo '```' >> README.md
	echo '```uv run learn-names-openai.py```' >> README.md
	echo '```' >> README.md
	uv run learn-names-openai.py >> README.md
	echo '```' >> README.md

review:
	echo '```uv run review-learn-names.py > review-learn-names.md```' >> README.md
	echo '[review-learn-names](review-learn-names)' >> README.md
	uv run review-learn-names.py > review-learn-names.md

	echo '```uv run review-learn-names-openai.py > review-learn-names-openai.md```' >> README.md
	echo '[review-learn-names-openai](review-learn-names-openai)' >> README.md
	uv run review-learn-names-openai.py > review-learn-names-openai.md
