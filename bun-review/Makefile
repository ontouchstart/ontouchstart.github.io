all:	dev.log dev-test.log

bash:	build.log
	docker compose run --remove-orphans --rm dev bash 

dev-test.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make dev test' | tee dev-test.log

dev.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make dev' | tee dev.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm -rf build.log dev.log dev-test.log
