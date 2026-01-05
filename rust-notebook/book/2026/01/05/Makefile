all:
	@echo "# 2026/01/05"
	@echo '`src/main.rs`'
	@echo '```rust'
	@echo '{{#include src/main.rs}}'
	@echo '```'
	@echo '```bash'
	cargo update
	cargo fmt 
	cargo build
	cargo run
	cargo run --release
	@echo '```'

