FROM nixos/nix
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake
RUN echo 'bun:;git clone https://github.com/oven-sh/bun.git && cd bun && git apply ../flake.patch && nix flake update' > Makefile
RUN echo 'dev:bun;cd bun && nix develop --command bash -c "RUSTC_BOOTSTRAP=1 BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off"' >> Makefile
RUN echo 'test:bun;cd bun && nix develop --command bash -c "RUSTC_BOOTSTRAP=1 BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off test"' >> Makefile
COPY flake.patch .

