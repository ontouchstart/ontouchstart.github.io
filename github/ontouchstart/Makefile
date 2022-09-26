test:	test-devcontainers-cli

test-devcontainers-cli:	devcontainers-cli
	cd devcontainers-cli && yarn && yarn compile && yarn package && yarn test

devcontainers-cli:
	git clone https://github.com/ontouchstart/devcontainers-cli.git

clean:
	rm -rf devcontainers-cli
