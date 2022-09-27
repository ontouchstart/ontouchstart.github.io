# https://hub.docker.com/r/jsii/superchain/tags
FROM jsii/superchain:1-buster-slim-nightly
USER root
RUN apt-get update -qy
RUN apt-get install -qy vim-tiny
USER superchain
