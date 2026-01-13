all:
	ls -a

	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose

	cargo check --verbose
	cargo build --verbose
	cargo fmt --verbose
	cargo test --verbose

	make check build fmt test expand

./bin/cargo-expand: ./bin/cargo
	cargo install cargo-expand --root .

./bin/cargo:
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .
	
check:	./bin/cargo
	./bin/cargo check --verbose

fmt:	./bin/cargo
	./bin/cargo fmt

build:	./bin/cargo
	./bin/cargo build

test:	./bin/cargo
	./bin/cargo test

expand: ./bin/cargo-expand
	./bin/cargo-expand expand --lib
	./bin/cargo-expand expand --test it_works
	

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
