all:	 devcontainers-cli devcontainers-images devcontainers-features

devcontainers-cli:
	git clone https://github.com/ontouchstart/devcontainers-cli.git
	cd devcontainers-cli && yarn && yarn compile && yarn package 

devcontainers-images:
	git clone https://github.com/ontouchstart/devcontainers-images.git

devcontainers-features:
	git clone https://github.com/ontouchstart/devcontainers-features.git

clean:
	rm -rf devcontainers-cli
	rm -rf devcontainers-images
	rm -rf devcontainers-features
