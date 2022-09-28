all:

build:
	docker compose build

version:
	docker compose run --rm -it dev bash -c "cat /etc/os-release && java -version"

bash:
	docker compose run --rm -it dev bash

clean:

