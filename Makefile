all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo update
	cargo fmt
	cargo test --lib
	cargo clean

test:
	cargo fmt
	cargo test

