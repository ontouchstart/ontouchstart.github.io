all:
	ls -a

	rustc --version --verbose
	cargo --version --verbose

	make ./bin/cargo
	make compare_cargo_versions
	make test

./bin/cargo:
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .
	
compare_cargo_versions: ./bin/cargo
	cargo --version --verbose > default-cargo-version-verbos.log
	./bin/cargo --version --verbose > local-cargo-version-verbos.log
	-diff default-cargo-version-verbos.log local-cargo-version-verbos.log

test:	./bin/cargo
	./bin/cargo test

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
