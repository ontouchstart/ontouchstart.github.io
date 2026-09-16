dev:	build.log profile-list.log version.log
	docker compose run  --remove-orphans --rm dev bash

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
