FROM mcr.microsoft.com/playwright:v1.62.1-noble
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y vim curl build-essential
RUN rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN git clone -b v1.62.1 https://github.com/microsoft/playwright
WORKDIR /playwright
RUN npm approve-scripts --all
RUN npm install 
RUN npm run build 
RUN npm install -g /playwright/packages/playwright
RUN npm install -g npm@latest pnpm@latest-11 bun@latest deno@latest
RUN playwright --version
RUN node --version
RUN npm --version
RUN pnpm --version
RUN bun --version
RUN deno --version
RUN cargo --version
WORKDIR /home
