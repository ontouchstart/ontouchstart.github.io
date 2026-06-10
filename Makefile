image=2026_06_10_npm_node_full_stack
all:up test down;
up: Dockerfile compose.yml home/server;docker compose up -d server --wait
test: Dockerfile compose.yml home/test;docker compose run --rm test
down:Dockerfile compose.yml;docker compose down

define Dockerfile
ARG DEBIAN_FRONTEND=noninteractive
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
RUN curl -fsSL https://deb.nodesource.com/setup_24.x |  bash -
RUN apt install -y nodejs pkg-config libssl-dev libcap-dev

WORKDIR /home
CMD ["bash"]
endef
export Dockerfile

define compose_yml
services:
  server:
    build:
      context: .
    volumes:
      - ./home/server:/home
    command: make
    ports:
      - "3000:3000"
    restart: always
    healthcheck:
      test: ["CMD-SHELL", "curl -s http://localhost:3000 || exit 1"]
      interval: 5s
      timeout: 3s
      retries: 5
  test:
    build:
      context: .
    command: make
    volumes:
      - ./home/test/:/home
endef
export compose_yml

define server_js
const http = require('http');
const server = http.createServer((req, res) => {res.end('Hello from server\\n');});
server.listen(3000, () => console.log('Server listening on port 3000'));
endef
export server_js

define client_js
const http = require('http');
http.get('http://server:3000', res => {res.on('data', chunk => process.stdout.write(chunk));});
endef
export client_js

Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
compose.yml:;@echo "$$compose_yml" > compose.yml
build:Dockerfile;docker build --no-cache -t $(image) .

home/server:;mkdir -p home/server&&echo "$$server_js" > home/server/index.js&&echo "all:;node index.js" > home/server/Makefile
home/test:;mkdir -p home/test&&echo "$$client_js" > home/test/index.js&&echo "all:;node index.js" > home/test/Makefile

clean:;rm -rf Dockerfile compose.yml home
