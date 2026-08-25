# bun-revew

## This is not an AI assisted project.

---

https://github.com/oven-sh/bun

---

https://ontouchstart.github.io/bun-review/Makefile

```Makefile
bash:	build.log
	docker compose run --remove-orphans --rm dev bash 

dev.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make dev' | tee dev.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm build.log dev.log
```
---

https://ontouchstart.github.io/bun-review/Dockerfile

```Dockerfile
FROM nixos/nix
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake
RUN echo 'bun:;git clone https://github.com/oven-sh/bun.git' > Makefile
RUN echo 'dev:bun;cd bun && git apply ../flake.patch && nix flake update && nix develop --command bash -c "RUSTC_BOOTSTRAP=1 BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off"' >> Makefile
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

---

https://ontouchstart.github.io/bun-review/flake.patch
