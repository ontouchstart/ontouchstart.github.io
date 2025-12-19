all:
	
	echo > README.md
	echo '```python' >> README.md
	cat -n main.py >> README.md
	echo '```' >> README.md
	echo '```' >> README.md
	echo "sam@Sams-MacBook-Pro ontouchstart.github.io % uv run main.py" >> README.md
	uv run main.py >> README.md
	echo '```' >> README.md
