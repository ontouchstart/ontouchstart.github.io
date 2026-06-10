image=2026_06_10_cabal_ghc
all:Dockerfile;docker run -v ./home:/home --rm $(image) bash -c "make -C /home"
bash:Dockerfile;docker run -v ./home:/home --rm -it $(image) bash

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
RUN apt install -y cabal-install haskell-stack

WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile 
