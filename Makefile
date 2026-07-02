image=2026_07_01_npm_node_pg_full_stack
all:up test down;
up: Dockerfile compose.yml home/server;docker compose up -d db server --wait
dev: Dockerfile compose.yml home/server;docker compose exec server bash
test: Dockerfile compose.yml home/test;docker compose run --rm test
down:Dockerfile compose.yml;docker compose down

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git make neovim
RUN curl -fsSL https://deb.nodesource.com/setup_24.x |  bash -
RUN apt-get install -y nodejs pkg-config libssl-dev libcap-dev

WORKDIR /home
CMD ["bash"]
endef
export Dockerfile

define compose_yml
services:
  db:
    image: postgres:14-alpine
    container_name: postgres_db
    restart: always
    environment:
      # IMPORTANT: Change these values for production or security!
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: testdb
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $$$$POSTGRES_USER -d $$$$POSTGRES_DB"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 10s
    volumes:
      # Persist data so it survives container restarts
      - postgres_data:/var/lib/postgresql/data
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
volumes:
  postgres_data:
endef
export compose_yml

define server_mjs
import http from 'node:http';
const server = http.createServer((req, res) => {res.end('Hello from server\\n');});
server.listen(3000, () => console.log('Server listening on port 3000'));
endef
export server_mjs

define package_json
{
  "dependencies": {
    "pg": "^8.22.0"
  }
}
endef
export package_json

define client_mjs
import http from 'node:http';
import pkg from 'pg';

http.get('http://server:3000', res => {res.on('data', chunk => process.stdout.write(chunk));});

const { Pool } = pkg;

const pool = new Pool({
  connectionString: 'postgresql://myuser:mypassword@db:5432/testdb'
});

const main = async () => {
	const result = await pool.query('SELECT CURRENT_TIME;');
	console.log(result);
};

await main();

endef
export client_mjs

Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
compose.yml:;@echo "$$compose_yml" > compose.yml
build:Dockerfile;docker build --no-cache -t $(image) .

home/server:;mkdir -p home/server&&echo "$$server_mjs" > home/server/index.mjs&&echo "all:;node --watch index.mjs" > home/server/Makefile
home/test:;mkdir -p home/test&&echo "$$client_mjs" > home/test/index.mjs&&echo "all:;npm install&&node index.mjs" > home/test/Makefile&&echo "$$package_json" > home/test/package.json

clean:;rm -rf Dockerfile compose.yml home
