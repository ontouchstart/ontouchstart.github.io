release=b9775
image=2026_06_23_nvim_rustup_elan_llama_cpp:$(release)
all:Dockerfile;docker run --rm $(image) make&&docker images
bash:Dockerfile;docker run --rm -it $(image)

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git libgmp-dev libuv1-dev libssl-dev llvm-dev cmake ccache clang pkgconf
ENV CC=clang-19

WORKDIR /opt

RUN git clone --depth=1 -b $(release) https://github.com/ggml-org/llama.cpp
WORKDIR /opt/llama.cpp

RUN cmake -B build && make -C build 
RUN /opt/llama.cpp/build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --single-turn --prompt "1 + 1 = ?"

WORKDIR /opt

RUN git clone -b v0.12.3 --depth=1 https://github.com/neovim/neovim.git
WORKDIR /opt/neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install
RUN mkdir -p /root/.config/nvim/
RUN echo 'vim.pack.add { "https://github.com/Julian/lean.nvim" }' > /root/.config/nvim/init.lua
RUN echo 'vim.g.lean_config = { mappings = true }' >> /root/.config/nvim/init.lua
RUN echo 'local termfeatures = vim.g.termfeatures or {}' >> /root/.config/nvim/init.lua
RUN echo 'termfeatures.osc52 = false' >> /root/.config/nvim/init.lua
RUN echo 'vim.g.termfeatures = termfeatures' >> /root/.config/nvim/init.lua
RUN nvim --headless -c "quit"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 

RUN curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
ENV PATH=/opt/llama.cpp/build/bin:/root/.cargo/bin:/root/.elan/bin:$$PATH

WORKDIR /home

RUN echo 'all:;llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --single-turn --prompt "Write an axiomatic proof for 2 + 2 = 2 * 2 = 2 ^2 in lean4 without tactics."' > Makefile

RUN lean --version
RUN leanc --version
RUN lake --version

CMD ["bash"]
endef

export Dockerfile

Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile

