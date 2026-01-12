all:
	ls -a

	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose
	cargo update --verbose

	make test

./bin/cargo:
	cargo check --verbose
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .
	
check:	./bin/cargo
	./bin/cargo check --verbose

fmt:	check
	./bin/cargo fmt

test:	fmt
	./bin/cargo test

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	rm 
	ls -a
