FROM node
COPY ./servers /servers
WORKDIR /servers/src/everything
RUN npm install
CMD ["npm", "run", "start:streamableHttp"]

