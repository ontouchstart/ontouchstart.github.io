test:
	docker compose run --rm --remove-orphans dev bash -c 'playwright cli --browser=firefox open http://ontouchstart.github.io/playwright && cat .playwright-cli/*' | tee test.log
dev:
	docker compose run --rm --remove-orphans dev bash
build:
	docker compose build --no-cache
