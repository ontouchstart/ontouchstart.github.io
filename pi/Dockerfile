FROM node:lts
# Install build dependencies for node-gpy
RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
  build-essential \
  && rm -rf /var/lib/apt/lists/*  
RUN git clone -b v0.87.1 https://github.com/earendil-works/pi
WORKDIR /pi
RUN npm install
RUN npm run build
RUN npm install -g /pi/packages/coding-agent/
RUN npm install -g --allow-scripts=bun bun
WORKDIR /
