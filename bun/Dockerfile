FROM nixos/nix
RUN git clone -b bun-v1.4.0 --depth=1 https://github.com/oven-sh/bun.git
WORKDIR /bun
# RUN nix --extra-experimental-features "nix-command flakes" flake update
# RUN nix --extra-experimental-features nix-command --extra-experimental-features flakes develop
