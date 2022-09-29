all:
	build test

build:
	docker compose build

test:
	docker compose run --rm dev /test.sh

bash:
	docker compose run --rm -it dev bash

clean:

