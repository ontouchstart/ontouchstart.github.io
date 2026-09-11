FROM node
RUN git clone -b v0.85.1 https://github.com/earendil-works/pi
WORKDIR /pi
RUN npm install
RUN npm run build
RUN npm install -g /pi/packages/coding-agent/
RUN npm install -g --allow-scripts=bun bun
WORKDIR /
