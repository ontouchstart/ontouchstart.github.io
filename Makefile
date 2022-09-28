all:
	docker compose run --rm -it dev make 

build:
	docker compose build
	docker images

version:
	docker compose run --rm -it dev make version

bash:
	docker compose run --rm -it dev bash

clean:
	docker compose run --rm -it dev make clean

