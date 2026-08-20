FROM nixos/nix
RUN nix-channel --update

RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
RUN nix profile list

RUN nix-env -iA nixpkgs.vim
RUN nix-env -iA nixpkgs.python3
RUN nix-env -iA nixpkgs.go
RUN nix-env -iA nixpkgs.nodejs
RUN nix-env -iA nixpkgs.deno
RUN nix-env -iA nixpkgs.bun
RUN nix-env -iA nixpkgs.rustup
RUN nix profile list
