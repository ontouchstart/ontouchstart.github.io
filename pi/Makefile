dev:
	docker compose run --rm --remove-orphans dev bash
version:
	docker compose run --rm --remove-orphans dev pi --version 1> pi.version.1.log 2> pi.version.2.log
	docker compose run --rm --remove-orphans dev bun --version 1> bun.version.1.log 2> bun.version.2.log
	docker compose run --rm --remove-orphans dev jq --version 1> jq.version.1.log 2> jq.version.2.log
build:
	docker compose build --no-cache 1> build.1.log 2> build.2.log
