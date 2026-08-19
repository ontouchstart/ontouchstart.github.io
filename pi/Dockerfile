FROM node
RUN git clone -b v0.84.2 https://github.com/earendil-works/pi
WORKDIR /pi
RUN npm install
RUN npm run build
RUN npm install -g /pi/packages/coding-agent/
WORKDIR /
