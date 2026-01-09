all:	
	cargo install cargo-expand
	cargo --version
	cargo update
	cargo fmt
	cargo test
	cargo expand
