dev:	home
	docker compose run --rm --remove-orphans dev bash

home:
	git clone https://github.com/honojs/hono.git home

build:
	docker compose build --no-cache

clean:
	rm -rf home
