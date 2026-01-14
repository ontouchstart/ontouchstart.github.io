all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	uv --version

