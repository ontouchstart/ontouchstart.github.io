all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo add --dev --git https://github.com/ontouchstart/ontouchstart.github.io --branch ontouchstart_2026_01_14_rs ontouchstart_2026_01_14_rs
	cargo add --dev proptest
	cargo test --verbose

