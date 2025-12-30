all:
	echo "# poc_pyo3_rs"
	cargo fmt
	cargo build
	cargo run --bin poc_pyo3_rs
	cargo run --bin this
	cargo run --bin now
	
