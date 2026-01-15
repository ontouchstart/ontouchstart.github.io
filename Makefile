all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo add --dev --git https://github.com/ontouchstart/ontouchstart.github.io --branch ontouchstart_2026_01_15_rs default
	cargo update
	cargo test --tests
	cargo clean

test:
	cargo fmt
	cargo test --tests --verbose
