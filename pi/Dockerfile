FROM node:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables so Rust tools are found automatically
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

# Install rustup non-interactively
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN pi install git:github.com/huggingface/pi-llama
WORKDIR /home
