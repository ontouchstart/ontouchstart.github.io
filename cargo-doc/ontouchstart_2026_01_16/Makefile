all:
	cargo add --git https://github.com/ontouchstart/ontouchstart.github.io --branch ontouchstart_2026_01_16_rs
	cargo update
	cargo test
	cargo clean --doc --target-dir .
	cargo doc --release --target-dir . 
	rm -rf release
	cargo clean 
