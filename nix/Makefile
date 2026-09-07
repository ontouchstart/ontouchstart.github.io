all:	build.log profile-list.log version.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log


profile-list.log:
	docker compose run  --remove-orphans --rm dev nix profile list | tee profile-list.log

version.log:
	docker compose run  --remove-orphans --rm dev nix --version | tee version.log

dev:	build.log
	docker compose run  --remove-orphans --rm dev bash

repl:	build.log
	docker compose run  --remove-orphans --rm dev nix repl


clean:
	rm -rf *.log
