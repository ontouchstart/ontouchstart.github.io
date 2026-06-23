release=b9773	# https://github.com/ggml-org/llama.cpp/releases/tag/b9773
image=2026_06_23_llama_cpp:$(release)
all:Dockerfile;docker run --rm $(image) bash -c "make -C /home proof"

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git make neovim
RUN curl -fsSL https://deb.nodesource.com/setup_24.x |  bash -
RUN apt-get install -y nodejs pkg-config libssl-dev libcap-dev
RUN apt-get install -y bubblewrap build-essential ccache clang-19 cmake gdb jq libcap-dev llvm pkg-config python3.13-venv
ENV CC=clang-19

WORKDIR /home
RUN git clone --depth=1 -b $(release) https://github.com/ggml-org/llama.cpp
RUN echo 'setup:llama.cpp/build/bin;/home/llama.cpp/build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --single-turn --prompt "1 + 1 = ?"' > Makefile
RUN echo 'proof:llama.cpp/build/bin;/home/llama.cpp/build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --single-turn --prompt "Write an Axiomatic Proof for 2 + 2 = 2 * 2 = 2 ^2 in lean4 without tactics."' >> Makefile
RUN echo 'life:llama.cpp/build/bin;/home/llama.cpp/build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --single-turn --prompt "What is the meaning of life?"' >> Makefile
RUN echo "llama.cpp/build/bin:;cd llama.cpp && cmake -B build && make -C build" >> Makefile
RUN make	# this will cache the -hf model
CMD ["bash"]
endef
export Dockerfile

bash:Dockerfile;docker run --rm -it $(image) 
Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .

clean:;rm -rf Dockerfile 
