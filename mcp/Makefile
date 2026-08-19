up:
	docker compose up everything -d

down:
	docker compose down

dev:
	docker compose run --remove-orphans --rm dev bash

everything-dev:
	docker compose exec everything bash

build:	modelcontextprotocol servers typescript-sdk
	docker compose build

modelcontextprotocol:
	git clone -b 2026-07-28  https://github.com/modelcontextprotocol/modelcontextprotocol.git

typescript-sdk:
	git clone -b 1.30.0 https://github.com/modelcontextprotocol/typescript-sdk

servers:
	git clone -b 2026.8.18 https://github.com/modelcontextprotocol/servers.git

clean:
	rm -rf modelcontextprotocol servers typescript-sdk
