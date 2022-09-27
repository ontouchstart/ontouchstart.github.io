all:

build:
	docker compose build

version:
	docker compose run --rm dev version

bash:
	docker compose run --rm --interactive --entrypoint=/bin/bash dev

clean:

