all:
	ls -a

	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose

	make ./bin/cargo
	make check build test

./bin/cargo:
	cargo check --verbose
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .
	
check:	./bin/cargo
	./bin/cargo check --verbose

build:	./bin/cargo
	cargo build
	./bin/cargo build

test:	./bin/cargo
	cargo test
	./bin/cargo test

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
