all:
	uv add ipython ruff
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
	uv run ipython -i main.py
