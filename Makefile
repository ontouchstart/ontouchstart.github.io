all:	
	ls -a

	rustc --version --verbose
	cargo --version --verbose

	cargo install cargo --root .

	./bin/cargo --version --verbose

	cat -n .crates.toml 
	cat .crates2.json | jq .

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf bin target
	ls -a
