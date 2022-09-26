test:	test-devcontainers-images

test-devcontainers-images: test-devcontainers-images-configuration

test-devcontainers-images-configuration: devcontainers-cli devcontainers-images
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/anaconda read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/base-alpine read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/base-debian read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/base-ubuntu read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/cpp read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/dotnet read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/go read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/java read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/java-8 read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/javascript-node read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/jekyll read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/miniconda read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/php read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/python read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/ruby read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/rust read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/typescript-node read-configuration | jq .
	./devcontainers-cli/devcontainer.js --workspace-folder devcontainers-images/src/universal read-configuration | jq .

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
