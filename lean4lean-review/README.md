# lean4lean-review

(This is not an AI assisted project.)

The objective is to _explore_ and _review_ code base of the [lean4lean project](https://github.com/digama0/lean4lean) via interactive or automated processes in a nixos/nix docker environment. 

Deterministic log files are committed to the git repo for interactive and automated analysis.

---

https://github.com/digama0/lean4lean

---

https://ontouchstart.github.io/lean4lean-review/Makefile

```Makefile
all:	lake-build.log

bash:	build.log
	docker compose run --remove-orphans --rm dev bash 

lake-build.log:	build.log
	docker compose run --remove-orphans --rm dev bash -c 'make lean4lean/.lake/build' | tee lake-build.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

clean:
	rm -rf *.log
```

https://ontouchstart.github.io/lean4lean-review/Dockerfile

```dockerfile
FROM nixos/nix
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN nix-channel --update
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake nixpkgs.elan
RUN echo 'lean4lean:;git clone https://github.com/digama0/lean4lean.git' > Makefile
RUN echo 'lean4lean/.lake/build:lean4lean;cd lean4lean && lake build' >> Makefile

```

https://ontouchstart.github.io/lean4lean-review/compose.yml

```yml
services:
  dev:
    build:
      context: .
```

--- 

https://ontouchstart.github.io/lean4lean-review/build.log

https://ontouchstart.github.io/lean4lean-review/lake-build.log

