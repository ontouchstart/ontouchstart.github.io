all:	
	cargo update
	cargo fmt
	cargo build --release
	./target/release/ontouchstart_2026_01_05

mistral.md:
	./target/release/mistral  &> mistral.md
