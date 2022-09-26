test:	test-images test-containers test-devcontainers-cli

test-containers: devcontainers-cli test-dotnet test-typescript-node 

test-images: devcontainers-cli
	./devcontainers-cli/devcontainer.js read-configuration --workspace-folder devcontainers-images/src/dotnet| jq .
	./devcontainers-cli/devcontainer.js read-configuration --workspace-folder devcontainers-images/src/go| jq .
	./devcontainers-cli/devcontainer.js read-configuration --workspace-folder devcontainers-images/src/rust| jq .

test-dotnet:
	./devcontainers-cli/devcontainer.js up --workspace-folder devcontainers-images/src/dotnet
	-./devcontainers-cli/devcontainer.js exec --workspace-folder devcontainers-images/src/dotnet bash -c "cd test-project && bash test.sh"
	docker rm -f `docker ps | awk '/vsc-dotnet-/ { print $$1 }'`
	docker rmi -f `docker images | awk '/vsc-dotnet-/ { print $$3 }'`

test-go:
	./devcontainers-cli/devcontainer.js up --workspace-folder devcontainers-images/src/go
	-./devcontainers-cli/devcontainer.js exec --workspace-folder devcontainers-images/src/go bash -c "cd test-project && bash test.sh"
	docker rm -f `docker ps | awk '/vsc-go-/ { print $$1 }'`
	docker rmi -f `docker images | awk '/vsc-go-/ { print $$3 }'`

test-typescript-node:
	./devcontainers-cli/devcontainer.js up --workspace-folder devcontainers-images/src/typescript-node
	-./devcontainers-cli/devcontainer.js exec --workspace-folder devcontainers-images/src/typescript-node bash -c "cd test-project && bash test.sh"
	docker rm -f `docker ps | awk '/vsc-typescript-node-/ { print $$1 }'`
	docker rmi -f `docker images | awk '/vsc-typescript-node-/ { print $$3 }'`


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

clean-images:
	-docker rm -f `docker ps -qa`
	-docker rmi -f `docker images -qa`
