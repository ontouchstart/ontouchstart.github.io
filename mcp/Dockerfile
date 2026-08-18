FROM node
RUN apt-get update
RUN apt-get install -y neovim golang-go
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN npm install -g pnpm
COPY ./modelcontextprotocol /modelcontextprotocol
COPY ./servers /servers
WORKDIR /servers
RUN npm install
RUN npm run build
COPY ./typescript-sdk /typescript-sdk
WORKDIR /typescript-sdk
RUN pnpm install
RUN pnpm build:all
