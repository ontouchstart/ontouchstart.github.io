FROM nixos/nix:2.35.2-arm64
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN nix-env -iA nixpkgs.pi-coding-agent
RUN git clone https://github.com/nix-ontouchstart/react.git
WORKDIR /react
