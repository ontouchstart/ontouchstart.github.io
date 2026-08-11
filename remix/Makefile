test:	remix
	docker compose run --rm --remove-orphans test > test.log

remix-guides:	remix
	docker compose up remix-guides

remix-api:	remix
	docker compose up remix-api

build:	remix
	docker compose build --no-cache

remix:
	git clone https://github.com/remix-run/remix.git

clean:
	rm -rf remix
