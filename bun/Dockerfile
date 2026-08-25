FROM nixos/nix
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake
RUN echo "bun:;git clone https://github.com/oven-sh/bun.git" > Makefile
COPY flake.patch .

