bash:dev.1.log;docker compose run --remove-orphans --rm dev bash
dev-test.1.log:dev.1.log;docker compose run --remove-orphans --rm dev bash -c 'make dev test' 1> dev-test.1.log 2> dev-test.2.log
dev.1.log:build.1.log;docker compose run --remove-orphans --rm dev bash -c 'make dev' 1> dev.1.log 2> dev.2.log
build.1.log:;docker compose --progress=plain build --no-cache 1> build.1.log 2> build.2.log
clean:;rm -rf *.log *.err
