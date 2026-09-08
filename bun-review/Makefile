all:	build.log profile-list.log version.log bun-debug.log

home/bun:
	cd home && git clone --depth=1 https://github.com/oven-sh/bun.git 
	cd home/bun && git apply ../flake.patch
	docker compose run  --remove-orphans --rm bun nix flake update

bun-debug.log: home/bun build.log
	docker compose run  --remove-orphans --rm bun nix develop --command bash -c "bun scripts/build.ts --profile=debug --asan=off"  | tee bun-debug.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

profile-list.log:
	docker compose run  --remove-orphans --rm dev nix profile list | tee profile-list.log

version.log:
	docker compose run  --remove-orphans --rm dev nix --version | tee version.log

dev:	build.log
	docker compose run  --remove-orphans --rm bun nix develop

repl:	build.log
	docker compose run  --remove-orphans --rm dev nix repl

clean:
	rm -rf *.log home/bun
