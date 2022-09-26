DEVCONTAINER=./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src
test:	test-devcontainers-images

test-devcontainers-images: test-devcontainers-images-configuration

test-devcontainers-images-configuration: devcontainers-cli devcontainers-images
	$(DEVCONTAINER)/anaconda read-configuration | jq .
	$(DEVCONTAINER)/base-alpine read-configuration | jq .
	$(DEVCONTAINER)/base-debian read-configuration | jq .
	$(DEVCONTAINER)/base-ubuntu read-configuration | jq .
	$(DEVCONTAINER)/cpp read-configuration | jq .
	$(DEVCONTAINER)/dotnet read-configuration | jq .
	$(DEVCONTAINER)/go read-configuration | jq .
	$(DEVCONTAINER)/java read-configuration | jq .
	$(DEVCONTAINER)/java-8 read-configuration | jq .
	$(DEVCONTAINER)/javascript-node read-configuration | jq .
	$(DEVCONTAINER)/jekyll read-configuration | jq .
	$(DEVCONTAINER)/miniconda read-configuration | jq .
	$(DEVCONTAINER)/php read-configuration | jq .
	$(DEVCONTAINER)/python read-configuration | jq .
	$(DEVCONTAINER)/ruby read-configuration | jq .
	$(DEVCONTAINER)/rust read-configuration | jq .
	$(DEVCONTAINER)/typescript-node read-configuration | jq .
	$(DEVCONTAINER)/universal read-configuration | jq .

test-devcontainers-cli:	devcontainers-cli devcontainers-images
	cd devcontainers-cli && yarn test

devcontainers-cli:
	git clone https://github.com/ontouchstart/devcontainers-cli.git
	cd devcontainers-cli && yarn && yarn compile && yarn package 

devcontainers-images:
	git clone https://github.com/ontouchstart/devcontainers-images.git

clean:
	rm -rf devcontainers-cli
	rm -rf devcontainers-images
