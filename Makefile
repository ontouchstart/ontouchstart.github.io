all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo check
	cargo fmt
	cargo test --lib --verbose
	cargo clean

rtfm:
	cargo doc --open
