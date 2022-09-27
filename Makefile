all:
	docker compose run --rm dev dotnet run --project hello

version:
	docker compose run --rm dev dotnet --version

bash:
	docker compose run --rm -it dev bash

clean:
	docker compose run --rm -it dev rm -rf hello/bin hello/obj

