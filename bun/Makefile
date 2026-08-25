dev:	build.log
	docker compose run --remove-orphans --rm dev bash

build.log:
	docker compose --progress=plain build | tee build.log

clean:
	rm build.log
