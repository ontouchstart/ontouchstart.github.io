tag=4.31.0
image=2026_06_15_lean4:$(tag)
version:Dockerfile;docker run --rm $(image) bash -c 'lean --version'
bash:Dockerfile;docker run --rm -it $(image)

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git libgmp-dev libuv1-dev libssl-dev cmake ccache clang pkgconf
WORKDIR /home
RUN curl -sLO https://github.com/leanprover/lean4/archive/refs/tags/v$(tag).tar.gz
RUN tar -xzvf v$(tag).tar.gz 
RUN echo "lean4-$(tag)/build:lean4-$(tag);cd lean4-$(tag)&&cmake --preset release&&make -C build/release install -j$$(nproc)" > Makefile
RUN make
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile
