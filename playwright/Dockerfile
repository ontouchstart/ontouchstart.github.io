FROM mcr.microsoft.com/playwright:v1.62.1-noble
RUN apt-get update
RUN apt-get install -y vim
RUN git clone -b v1.62.1 https://github.com/microsoft/playwright
WORKDIR /playwright
RUN npm approve-scripts --all
RUN npm install 
RUN npm run build 
