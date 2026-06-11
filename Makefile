# https://www.youtube.com/watch?v=l9hUGoN6BLM
image=2026_06_11_leanc
all:Dockerfile;docker run -v ./home:/home --rm $(image) bash -c "make -C /home"
bash:Dockerfile;docker run -v ./home:/home --rm -it $(image) bash

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
WORKDIR /opt
RUN curl -sSfOL https://elan.lean-lang.org/elan-init.sh
RUN sh /opt/elan-init.sh -y

ENV PATH=/root/.elan/bin/:$$PATH}
ENV ELAN_HOME=/root/.elan
RUN mkdir -p /root/.elan/toolchains
RUN lean --version
RUN lake --version
WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile home/hello
