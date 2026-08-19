FROM node
RUN apt-get update
RUN apt-get install -y neovim golang-go
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN npm install -g pnpm

WORKDIR /
RUN git clone -b 2026-07-28  https://github.com/modelcontextprotocol/modelcontextprotocol.git
RUN git clone -b 1.30.0 https://github.com/modelcontextprotocol/typescript-sdk.git
RUN git clone -b 2026.8.18 https://github.com/modelcontextprotocol/servers.git
RUN git clone -b v1.62.1 https://github.com/microsoft/playwright.git

WORKDIR /servers
RUN npm install
RUN npm run build

WORKDIR /playwright
RUN npm install-scripts approve --all
RUN npm install
RUN npm run build
RUN npm install -g /playwright/packages/playwright
RUN playwright install-deps
RUN playwright cli install-browser

WORKDIR /
