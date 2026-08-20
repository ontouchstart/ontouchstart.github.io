test:
	docker compose run --rm --remove-orphans dev bash -c 'playwright cli --browser=chromium open https://news.ycombinator.com/item?id=49362728 && cat .playwright-cli/*' | tee test.yaml
dev:
	docker compose run --rm --remove-orphans dev bash
build:
	docker compose build --no-cache
