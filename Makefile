all:
	cat -n /etc/os-release 
	dpkg --list --no-pager 

snaplet-postgres-wasm:
	git clone https://github.com/ontouchstart/snaplet-postgres-wasm.git
	sudo apt-get install -y xsel

serve: 	snaplet-postgres-wasm
	python -m http.server --directory snaplet-postgres-wasm/packages/runtime

clean:
	rm -rf snaplet-postgres-wasm
