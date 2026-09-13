bash:dev.log;docker compose run --remove-orphans --rm dev bash 
dev-test.log:dev.log;docker compose run --remove-orphans --rm dev bash -c 'make dev test' > dev-test.log 2> dev-test.err
dev.log:build.log;docker compose run --remove-orphans --rm dev bash -c 'make dev' > dev.log 2> dev.err
build.log:;docker compose --progress=plain build --no-cache > build.log 2> build.err
clean:;rm -rf *.log *.err
