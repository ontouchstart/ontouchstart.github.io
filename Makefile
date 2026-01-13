all:
	cargo add --git https://github.com/ontouchstart/ontouchstart.github.io --branch 2026_01_13_rs ontouchstart_2026_01_13_rs
	cargo update
	cargo test --all-features
