test:	remix
	docker compose run --rm --remove-orphans dev bash -c 'cd /remix && pnpm install && pnpm run test' > test.log

remix-guides:	remix
	docker compose run --rm --remove-orphans dev bash -c 'cd /remix && pnpm --filter remix-guides run prerender --dir /home/remix-guides'

dev:	remix
	docker compose run --rm --remove-orphans dev bash

build:
	docker compose build --no-cache

remix:
	git clone https://github.com/remix-run/remix.git

clean:
	rm -rf remix
