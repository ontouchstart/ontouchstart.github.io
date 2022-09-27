all:

build:
	docker compose build

version:
	docker compose run --rm dev bazel --version

bash:
	docker compose run --rm -it dev

clean:

