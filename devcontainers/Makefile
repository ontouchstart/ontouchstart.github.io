all:	vscode-remote-try-rust
	yarn init -y
	yarn add @devcontainers/cli
	npx devcontainer --version
	npx devcontainer --help
	npx devcontainer up --workspace-folder vscode-remote-try-rust
	npx devcontainer exec --workspace-folder vscode-remote-try-rust cargo test
	npx devcontainer exec --workspace-folder vscode-remote-try-rust cargo run

vscode-remote-try-rust:
	git clone https://github.com/microsoft/vscode-remote-try-rust
