dev:	build.log profile-list.log version.log
	docker compose run  --remove-orphans --rm dev bash

remote-hello:
	docker compose run  --remove-orphans --rm dev bash -c 'nix flake show "github:ontouchstart/ontouchstart.github.io?dir=nix/home/hello" && nix run "github:ontouchstart/ontouchstart.github.io?dir=nix/home/hello"' 1> remote-hello.1.log 2> remote-hello.2.log

remote-bootstrap-sqlite:
	docker compose run  --remove-orphans --rm dev bash -c 'nix flake show "github:ontouchstart/ontouchstart.github.io?dir=nix/home/bootstrap/sqlite" && nix run "github:ontouchstart/ontouchstart.github.io?dir=nix/home/bootstrap/sqlite"' 1> remote-bootstrap-sqlite.1.log 2> remote-bootstrap-sqlite.2.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

profile-list.log:
	docker compose run  --remove-orphans --rm dev nix profile list | tee profile-list.log

version.log:
	docker compose run  --remove-orphans --rm dev nix --version | tee version.log

install.sh:
	curl -sL https://nixos.org/nix/install > install.sh

clean:
	rm -rf *.log
