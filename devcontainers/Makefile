all:
	make cli-test
	make vscode-remote-try-rust-npx-test
	make vscode-remote-try-rust-cli-test

devcontainer: package.json
	yarn install

vscode-remote-try-rust-npx-test: devcontainer vscode-remote-try-rust
	npx devcontainer --version
	npx devcontainer --help
	npx devcontainer up --workspace-folder vscode-remote-try-rust
	npx devcontainer exec --workspace-folder vscode-remote-try-rust cargo test
	npx devcontainer exec --workspace-folder vscode-remote-try-rust cargo run

vscode-remote-try-rust-cli-test: cli vscode-remote-try-rust
	node cli/devcontainer.js --version
	node cli/devcontainer.js --help
	node cli/devcontainer.js up --workspace-folder vscode-remote-try-rust
	node cli/devcontainer.js exec --workspace-folder vscode-remote-try-rust cargo test

package.json:
	yarn init -y
	yarn add @devcontainers/cli

vscode-remote-try-rust:
	git clone https://github.com/microsoft/vscode-remote-try-rust

cli:
	git clone https://github.com/devcontainers/cli.git
	cd cli && yarn && yarn compile && yarn package

cli-test: cli
	echo "This going to take a while ..."
	cd cli && yarn test

clean: 
	rm -rf vscode-remote-try-rust
	rm -rf cli
