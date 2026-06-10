image=2026-06-10-docker-lake
all:Dockerfile;docker run --rm $(image) bash -c "lake --version"
bash:Dockerfile;docker run --rm -it $(image) 

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl
RUN curl -sSfL https://elan.lean-lang.org/elan-init.sh | sh -s -- -y
ENV PATH=/root/.elan/bin/:$$PATH}
ENV ELAN_HOME=/root/.elan
RUN mkdir -p /root/.elan/toolchains
RUN lean --version
RUN lake --version

WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
clean:;rm -rf Dockerfile
rmi:;docker rmi $(image)&&make clean
