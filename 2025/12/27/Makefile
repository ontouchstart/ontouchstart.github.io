all:
	@uv run readme.py
	@echo '% make'
	rm -rf uv.lock .venv
	uv add ruff pytest 
	uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@ask_mlx_lm" --no-cache
	uv run ruff check
	uv run ruff format
	@echo '```'
