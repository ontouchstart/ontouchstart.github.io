FROM node:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y vim curl build-essential
RUN rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN rustup target add wasm32-unknown-unknown

RUN npm install -g npm@latest pnpm@latest-11 bun@latest deno@latest
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN node --version
RUN npm --version
RUN pnpm --version
RUN bun --version
RUN deno --version
RUN cargo --version
COPY workers-rs /workers-rs
WORKDIR /workers-rs
