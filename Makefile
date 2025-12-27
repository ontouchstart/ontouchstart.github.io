all:
	cd find_matches && cargo fmt
	cd find_matches && cargo test
	cd find_matches && cargo build --release
