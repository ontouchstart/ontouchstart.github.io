all:	
	cargo install cargo-expand
	cargo --version
	cargo update
	cargo fmt
	cargo expand -p url --lib --tests
	cargo test -p url
	cargo expand -p branch --lib --tests
	cargo test -p branch
