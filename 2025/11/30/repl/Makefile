repl:
	uv add mlx_lm
	uv run python -i main.py

log:
	uv run python main.py | tee main.log
	echo '`main.log`' > main.md
	echo '```' >> main.md
	cat -n main.log >> main.md
	echo '```' >> main.md
