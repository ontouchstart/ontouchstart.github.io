image=2026_06_10_cargo_rustc
all:Dockerfile;docker run -v ./home:/home --rm $(image) bash -c "make -C /home"
bash:Dockerfile;docker run -v ./home:/home --rm -it $(image) bash

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
WORKDIR /opt
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.rs
RUN sh /opt/rustup.rs -y
ENV PATH=/root/.cargo/bin:$${PATH}

WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile 
