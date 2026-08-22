FROM nixos/nix
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim
RUN git clone -b bun-v1.4.0 --depth=1 https://github.com/oven-sh/bun.git
WORKDIR /bun
COPY flake.patch .
RUN git apply flake.patch
ENV RUSTC_BOOTSTRAP=1
RUN nix flake update
RUN nix develop --command bash -c "BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off"
RUN /bun/build/debug/bun-debug --help

