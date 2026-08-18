FROM node
RUN npm install -g pnpm
COPY ./servers /servers
WORKDIR /servers
RUN npm install
RUN npm run build
COPY ./typescript-sdk /typescript-sdk
WORKDIR /typescript-sdk

