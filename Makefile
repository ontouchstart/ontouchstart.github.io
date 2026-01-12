all:	
	ls -a

	rustc --version --verbose
	cargo --version --verbose

	cargo install cargo --root .

	./bin/cargo --version --verbose

	cat -n .crates.toml 
	cat .crates2.json | jq .

	make compare_cargo_versions

compare_cargo_versions:
	cargo --version --verbose > default-cargo-version-verbos.log
	./bin/cargo --version --verbose > local-cargo-version-verbos.log
	-diff default-cargo-version-verbos.log local-cargo-version-verbos.log

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
