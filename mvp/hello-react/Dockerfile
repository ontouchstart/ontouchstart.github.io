FROM node:latest
RUN apt-get update -qy && apt-get install -qy sudo vim-tiny
RUN npm install -g npm@latest
RUN mkdir /src && cd src && npx create-react-app hello-react && cd hello-react && npm install
RUN chown -R node.node /src
USER node
WORKDIR /src/hello-react
CMD npm start
