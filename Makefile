image=2026_06_14_lean4
version:Dockerfile;docker run --rm $(image) bash -c '/home/lean4-4.30.0/build/release/stage1/bin/lean --version'
bash:Dockerfile;docker run --rm -it $(image)

define Dockerfile
FROM debian:13-slim
RUN apt upgrade&&apt update
RUN apt install -y curl git neovim libgmp-dev libuv1-dev libssl-dev cmake ccache clang pkgconf
WORKDIR /home
RUN curl -sLO https://github.com/leanprover/lean4/archive/refs/tags/v4.30.0.tar.gz
RUN tar -xzvf v4.30.0.tar.gz 
RUN echo "lean4-4.30.0/build:lean4-4.30.0;cd lean4-4.30.0&&cmake --preset release&&make -C build/release -j$$(nproc)" > Makefile
RUN make
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
clean:;rm -rf Dockerfile
rmi:;docker rmi $(image)&&make clean
