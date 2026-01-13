all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose

	cargo check --verbose
	cargo build --verbose
	cargo fmt --verbose
	cargo test --verbose

clean:
	rm -rf *.log
	rm -rf bin target
	ls -a
