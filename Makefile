all:
	cd grrs && cargo build --release
	./grrs/target/release/grrs
	
