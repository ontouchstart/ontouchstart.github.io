# https://github.com/sdiehl/zero-to-qed
build:Dockerfile compose.yml home/Makefile;docker compose run --rm dev bash -c "make build"
dev:up;docker compose exec dev bash
up:Dockerfile compose.yml home/Makefile;docker compose up -d
down:;docker compose down
clean:;rm -rf home Dockerfile compose.yml

define home_Makefile
serve:justfile zero-to-qed;just serve
build:justfile zero-to-qed;just build
zero-to-qed:;git clone https://github.com/sdiehl/zero-to-qed
justfile:;echo "serve:" > justfile &&echo "  cd zero-to-qed/docs && mdbook serve -n 0.0.0.0" >> justfile
justfile:;echo "build:" > justfile &&echo "  cd zero-to-qed&&lake build" >> justfile
endef
export home_Makefile

home/Makefile:home;@echo "$$home_Makefile" > home/Makefile
home:;mkdir home

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git libcap-dev libgmp-dev libuv1-dev libssl-dev llvm-dev cmake ccache clang pkgconf
RUN apt-get install -y libgtk-3-0t64 libgbm-dev libnotify-dev libnss3 libxss1 libasound2t64 libxtst6 xauth xvfb
RUN curl -fsSL https://deb.nodesource.com/setup_25.x |  bash -
RUN apt-get install -y nodejs

WORKDIR /opt

RUN git clone https://github.com/neovim/neovim.git
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

# https://github.com/earendil-works/pi/tree/main/packages/coding-agent#quick-start
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN mkdir -p /root/.pi/agent
RUN echo '{ "providers": { "llama.cpp": { "baseUrl": "http://host.docker.internal:8080/v1", "api": "openai-completions", "apiKey": "none", "models": [ { "id": "ggml-org/gemma-4-12B-it-GGUF" } ] } } }' > /root/.pi/agent/models.json

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:/root/.elan/bin:$$PATH
ENV LEAN_NUM_THREADS=8

RUN cargo install mdbook --version 0.4.52
RUN cargo install just

WORKDIR /home
RUN cargo --version
RUN elan --version
endef
export Dockerfile

Dockerfile:;@echo "$$Dockerfile" > Dockerfile

define compose_yml
services:
  dev:
    build:
      context: .
    volumes:
      - ./home:/home
    ports:
      - "8000:3000"
    command: ["make", "serve"]
endef
export compose_yml

compose.yml:;@echo "$$compose_yml" > compose.yml
