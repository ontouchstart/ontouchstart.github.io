FROM nixos/nix
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim
RUN git clone -b bun-v1.4.0 --depth=1 https://github.com/oven-sh/bun.git
WORKDIR /bun
