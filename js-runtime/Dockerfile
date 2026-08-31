FROM node
ARG DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://deno.land/install.sh | sh
RUN curl -fsSL https://bun.com/install | bash

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV HOME="/root"
ENV DENO_INSTALL="$HOME/.deno"
ENV BUN_INSTALL="$HOME/.bun"
ENV RUST_INSTALL="$HOME/.cargo"
ENV UV_INSTALL="$HOME/.local/bin"

ENV PATH="$DENO_INSTALL/bin:$BUN_INSTALL/bin:$RUST_INSTALL/bin:$UV_INSTALL:$PATH"

RUN npm i -g @playwright/test
RUN playwright install-deps 
RUN playwright cli install-browser

