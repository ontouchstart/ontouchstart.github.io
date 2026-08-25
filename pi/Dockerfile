FROM node
RUN git clone -b v0.84.3 https://github.com/earendil-works/pi
WORKDIR /pi
RUN npm install
RUN npm run build
RUN npm install -g /pi/packages/coding-agent/
RUN npm install -g --allow-scripts=bun bun
WORKDIR /
