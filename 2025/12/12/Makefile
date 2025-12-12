install:
	uv add ipython ruff
	uv add requests
	uv add mlx_lm

build:
	uv run ruff check 
	uv run ruff format 
	echo '# 2025/12/12' > README.md
	echo '```' >> README.md
	echo 'main.py' >> README.md
	cat -n main.py >> README.md
	echo '% uv run main.py' >> README.md
	uv run main.py >> README.md
	echo '% uv run ipython main.py' >> README.md
	uv run ipython main.py >> README.md
	echo '```' >> README.md

	echo '```' >> README.md
	echo '% uv run mermaid.py' >> README.md
	echo '```' >> README.md
	uv run mermaid.py >> README.md

	echo '```' >> README.md
	echo '% uv run math.py' >> README.md
	echo '```' >> README.md
	uv run math.py >> README.md

	echo '```' >> README.md
	echo '% uv run history-of-LLM.py' >> README.md
	echo '```' >> README.md
	uv run history-of-LLM.py >> README.md


repl:
	uv run ipython -i main.py
