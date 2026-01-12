all:
	ls -a

	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose

	make ./bin/cargo
	make compare_cargo_versions
	make test

./bin/cargo:
	cargo check --verbose
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .

./bin/cargo-examples: ./bin/cargo
	./bin/cargo install cargo-examples --root .
	
compare_cargo_versions: ./bin/cargo
	cargo --version --verbose > default-cargo-version-verbos.log
	./bin/cargo --version --verbose > local-cargo-version-verbos.log
	-diff default-cargo-version-verbos.log local-cargo-version-verbos.log

check:	./bin/cargo
	./bin/cargo check --verbose

build:	check
	./bin/cargo build

fmt: 	check
	./bin/cargo fmt --verbose

test:	fmt
	./bin/cargo test --verbose

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
