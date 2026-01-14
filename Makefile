all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	uv --version
	uv run main.py
	cargo run

