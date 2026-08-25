bash:	build.log
	docker compose run --remove-orphans --rm dev bash 

dev.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make dev' | tee dev.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm build.log dev.log
