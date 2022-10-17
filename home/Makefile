all:	
	cd hello && cargo check && cargo build && cargo test && cargo run
	cd hello_test && cargo check && cargo build && cargo test

version:
	rustup --version
	rustc --version
	cargo --version

clean:
	rm -rf hello/target
	rm -rf hello_test/target
