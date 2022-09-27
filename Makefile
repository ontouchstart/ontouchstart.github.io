all:
	docker compose run --rm dev make 

version:
	docker compose run --rm dev make version

bash:
	docker compose run --rm -it dev bash

clean:
	docker compose run --rm dev make clean

