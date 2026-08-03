test:	build	home
	docker compose run --rm --remove-orphans dev bash -c 'pnpm install && pnpm run test' > test.log

dev:
	docker compose run --rm --remove-orphans dev bash

build:
	docker compose build --no-cache

home:
	git clone https://github.com/remix-run/remix.git home

clean:
	rm -rf home
