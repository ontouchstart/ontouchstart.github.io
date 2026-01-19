all:
	env
	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo update
	cargo fmt
	cargo test --lib
	cargo clean

test:
	cargo fmt
	cargo test

server: # do not run this in CI
	uv run mlx_lm.server

build:
	cargo build

models: # do not run this in CI
	./target/debug/mlx_lm_models | jq . | tee models.json

brown_mm:
	./target/debug/mlx_lm_brown_mm | jq . | tee brown_mm.json
