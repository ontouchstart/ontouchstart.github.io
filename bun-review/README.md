# bun-revew

(This is not an AI assisted project.)

The objective is to _explore_ and _review_ code base of the [bun project](https://github.com/oven-sh/bun) via interactive or automated processes in a nixos/nix docker environment. 

Deterministic log files are committed to the git repo for interactive and automated analysis.

---

https://github.com/oven-sh/bun

---

https://ontouchstart.github.io/bun-review/Makefile

```Makefile
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
```
---

https://ontouchstart.github.io/bun-review/Dockerfile

```Dockerfile
FROM nixos/nix
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake
RUN echo 'bun:;git clone https://github.com/oven-sh/bun.git && cd bun && git apply ../flake.patch && nix flake update' > Makefile
RUN echo 'dev:bun;cd bun && nix develop --command bash -c "RUSTC_BOOTSTRAP=1 BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off"' >> Makefile
RUN echo 'test:bun;cd bun && nix develop --command bash -c "RUSTC_BOOTSTRAP=1 BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off test"' >> Makefile
COPY flake.patch .

```
---

https://ontouchstart.github.io/bun-review/compose.yml

```yml
services:
  dev:
    build:
      context: .
```

--- 

https://ontouchstart.github.io/bun-review/build.log

https://ontouchstart.github.io/bun-review/dev.log

https://ontouchstart.github.io/bun-review/dev-test.log

---

https://ontouchstart.github.io/bun-review/flake.patch
