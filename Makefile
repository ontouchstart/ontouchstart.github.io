all:
	docker compose run --rm dev make 

version:
	docker compose run --rm dev make version

clean:
	docker compose run --rm dev make clean

