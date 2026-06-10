image=2026_06_10_npm_node
all:Dockerfile;docker run -v ./home:/home --rm $(image) bash -c "make -C /home"
bash:Dockerfile;docker run -v ./home:/home --rm -it $(image) bash

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
RUN curl -fsSL https://deb.nodesource.com/setup_24.x |  bash -
RUN apt install -y nodejs pkg-config libssl-dev libcap-dev

WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile 
