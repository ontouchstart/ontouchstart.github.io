image=2026-06-10-docker
all:Dockerfile;docker run --rm $(image) bash -c "uname -a"
bash:Dockerfile;docker run --rm -it $(image) 

define Dockerfile
FROM leanprovercommunity/lean4:latest
WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
clean:;rm -rf Dockerfile
rmi:;docker rmi $(image)&&make clean
