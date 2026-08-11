test:	remix
	docker compose run --rm --remove-orphans test > test.log

remix-guides:	remix
	docker compose up remix-guides

build:	remix
	docker compose build --no-cache

remix:
	git clone https://github.com/remix-run/remix.git

clean:
	rm -rf remix
