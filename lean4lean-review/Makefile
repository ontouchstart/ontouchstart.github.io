all:	lake-build.log theory.log verify.log

bash:	build.log
	docker compose run --remove-orphans --rm dev bash 


theory.log: build.log
	docker compose run --remove-orphans --rm dev /theory.sh | tee theory.log

verify.log: build.log
	docker compose run --remove-orphans --rm dev /verify.sh | tee verify.log

lake-build.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make lean4lean/.lake/build' | tee lake-build.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm -rf *.log
