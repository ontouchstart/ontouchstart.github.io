FROM node:16
RUN apt-get update -qy && apt-get install -qy sudo vim-tiny
RUN npm install -g npm@latest
RUN mkdir /src && chown -R node.node /src
USER node
WORKDIR /src/
RUN git clone https://github.com/facebook/react.git
RUN cd react && yarn install 
WORKDIR /src/react
