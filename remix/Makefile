test:	remix
	docker compose run --rm --remove-orphans remix-test > test.log

dev:
	docker compose run --rm --remove-orphans remix-test bash

up:
	docker compose up -d

down:
	docker compose down

build:	remix
	docker compose build --no-cache

remix:
	git clone https://github.com/remix-run/remix.git

clean:
	rm -rf remix
