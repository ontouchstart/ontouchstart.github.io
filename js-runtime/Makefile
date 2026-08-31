all:
	docker compose run --rm --remove-orphans dev bash -c 'playwright cli --browser=chromium open https://ontouchstart.github.io && cat tmp/.playwright-cli/*' | tee ontouchstart.github.io.yaml
dev:
	docker compose run --rm --remove-orphans dev bash
build:
	docker compose build --no-cache
