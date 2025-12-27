all:	export RUST_BACKTRACE=full
all:
	cd grrs && cargo fmt
	-cd grrs && cargo run -- 
	-cd grrs && cargo run -- some-pattern 
	-cd grrs && cargo run -- some-pattern some-file
	-cd grrs && cargo build --release
	-./grrs/target/release/grrs
	-./grrs/target/release/grrs some-pattern
	-./grrs/target/release/grrs some-pattern some-file

