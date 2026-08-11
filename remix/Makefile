remix-test:	remix
	docker compose run --rm --remove-orphans remix-test > test.log

remix-guides:	remix
	docker compose up remix-guides

remix-api:	remix
	docker compose up remix-api

remix-bookstore:	remix
	docker compose up remix-bookstore

build:	remix
	docker compose build --no-cache

remix:
	git clone https://github.com/remix-run/remix.git

clean:
	rm -rf remix
