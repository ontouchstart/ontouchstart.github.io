image=2026_06_10_dune_opam_ocaml
all:Dockerfile;docker run -v ./home:/home --rm $(image) bash -c "make -C /home"
bash:Dockerfile;docker run -v ./home:/home --rm -it $(image) bash

define Dockerfile
FROM debian:13-slim
RUN apt update&&apt install -y curl git make neovim
RUN apt install -y opam
RUN opam init -y
RUN echo 'eval $$(opam env)' >> /root/.bashrc 
RUN sh /root/.bashrc
RUN opam install dune utop -y
ENV PATH=/root/.opam/default/bin:$$PATH

WORKDIR /home
CMD ["bash"]
endef

export Dockerfile
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile home/project_name
