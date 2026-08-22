version:
	docker compose run  --remove-orphans --rm bun /bun/build/debug/bun-debug --version
help:
	docker compose run  --remove-orphans --rm bun /bun/build/debug/bun-debug --help
repl:
	docker compose run  --remove-orphans --rm bun /bun/build/debug/bun-debug repl
build:
	docker compose --progress=plain build --no-cache | tee build.log
