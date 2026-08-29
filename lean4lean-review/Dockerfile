FROM nixos/nix
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN nix-channel --update
RUN nix-env -iA nixpkgs.vim nixpkgs.gnumake nixpkgs.elan
RUN echo 'lean4lean:;git clone https://github.com/digama0/lean4lean.git' > Makefile
RUN echo 'lean4lean/.lake/build:lean4lean;cd lean4lean && lake build' >> Makefile
RUN echo '#!/root/.nix-profile/bin/sh' > theory.sh
RUN echo 'make lean4lean/.lake/build' >> theory.sh
RUN echo 'cd /lean4lean/Lean4Lean/Theory/' >> theory.sh
RUN echo 'lake env /lean4lean/.lake/build/bin/lean4lean --verbose' >> theory.sh
RUN echo '#!/root/.nix-profile/bin/sh' > verify.sh
RUN echo 'make lean4lean/.lake/build' >> verify.sh
RUN echo 'cd /lean4lean/Lean4Lean/Verify/' >> verify.sh
RUN echo 'lake env /lean4lean/.lake/build/bin/lean4lean --verbose' >> verify.sh
RUN chmod +x theory.sh verify.sh
