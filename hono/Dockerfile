FROM node
ARG DEBIAN_FRONTEND=noninteractive
RUN npm install -g --allow-scripts=bun bun
RUN git clone -b v4.13.3 https://github.com/honojs/hono.git
WORKDIR /hono
RUN npm install
RUN npm run build
RUN npm run test

