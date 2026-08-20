dev:
	docker compose run  --remove-orphans --rm dev bash

repl:
	docker compose run  --remove-orphans --rm dev nix repl

build:
	docker compose --progress=plain build --no-cache | tee build.log
