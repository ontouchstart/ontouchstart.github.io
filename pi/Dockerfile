FROM node
RUN git clone -b v0.84.2 https://github.com/earendil-works/pi
RUN git clone -b v1.62.1 https://github.com/microsoft/playwright
WORKDIR /playwright
RUN npm approve-scripts --all
RUN npm install 
RUN npm run build 
RUN npm install -g /playwright/packages/playwright
RUN playwright install-deps
RUN playwright cli install-browser
WORKDIR /pi
RUN npm install
RUN npm run build
RUN npm install -g /pi/packages/coding-agent/
WORKDIR /
