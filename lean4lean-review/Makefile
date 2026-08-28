all:	lake-build.log

bash:	build.log
	docker compose run --remove-orphans --rm dev bash 

lake-build.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make lean4lean/.lake/build' | tee lake-build.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm -rf *.log
