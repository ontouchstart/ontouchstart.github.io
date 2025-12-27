all:
	@uv run readme.py
	@echo '```'
	@echo '% make'
	rm -rf uv.lock .venv
	uv add ruff pytest 
	uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@ask_mlx_lm" --no-cache
	uv run ruff check
	uv run ruff format
	@echo '% make'
	make grrs
	@echo '```'

grrs: export RUST_BACKTRACE=full
grrs:
	cargo install --git https://github.com/ontouchstart/ontouchstart.github.io --branch grrs grrs --root .cargo
	-.cargo/bin/grrs some-pattern Makefile
	rm -rf .cargo

