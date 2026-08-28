FROM nixos/nix
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN nix-channel --update
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake nixpkgs.elan
RUN echo 'lean4lean:;git clone https://github.com/digama0/lean4lean.git' > Makefile
RUN echo 'lean4lean/.lake/build:lean4lean;cd lean4lean && lake build' >> Makefile

