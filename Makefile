all:	
	cargo install cargo-expand
	cargo --version
	cargo update
	cargo fmt
	cargo expand -p url
	cargo test -p url
	cargo expand -p branch
	cargo test -p branch
