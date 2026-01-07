all:	
	cargo update
	cargo fmt
	cargo test
	cargo build
	cargo run
	cargo run --release
