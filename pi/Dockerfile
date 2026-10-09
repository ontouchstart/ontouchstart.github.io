FROM nixos/nix:2.35.2-arm64
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
ENV TZ=America/New_York
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN nix profile add \
  github:NixOS/nixpkgs/master#pi-coding-agent \
  github:NixOS/nixpkgs/master#gnumake \
  github:NixOS/nixpkgs/master#vim
WORKDIR /workspace
