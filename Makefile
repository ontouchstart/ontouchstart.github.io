tag=v4.31.0
image=2026_06_23_git_lean4_llvm_nvim_fpil:$(tag)
gist=9c31f9fd884c73e10a6cc7074946e34e
cmake=cmake -B lean4-build -S lean4 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM=ON
all:Dockerfile;docker run --rm $(image) bash -c 'git clone https://gist.github.com/$(gist) && make -C $(gist)'
bash:Dockerfile;docker run --rm -it $(image)

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git libgmp-dev libuv1-dev libssl-dev llvm-dev cmake ccache clang pkgconf
WORKDIR /opt
RUN git clone --depth=1 -b $(tag) https://github.com/leanprover/lean4
RUN echo "def answer := 42\\n#eval answer\\n" > answer.lean
RUN echo "answer:lean4-build;lean answer.lean" > Makefile
RUN echo "lean4-build:lean4;$(cmake)&&make -C lean4-build install -j$$(nproc)" >> Makefile

RUN make lean4-build
ENV LEAN_CC=clang

RUN git clone -b v0.12.3 --depth=1 https://github.com/neovim/neovim.git
WORKDIR /opt/neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install
RUN mkdir -p /root/.config/nvim/
RUN echo 'vim.pack.add { "https://github.com/Julian/lean.nvim" }' > /root/.config/nvim/init.lua
RUN echo 'vim.g.lean_config = { mappings = true }' >> /root/.config/nvim/init.lua
RUN echo 'local termfeatures = vim.g.termfeatures or {}' >> /root/.config/nvim/init.lua
RUN echo 'termfeatures.osc52 = false' >> /root/.config/nvim/init.lua
RUN echo 'vim.g.termfeatures = termfeatures' >> /root/.config/nvim/init.lua
RUN nvim --headless -c "quit"
WORKDIR /home
CMD ["bash"]
endef

export Dockerfile

Dockerfile:;@echo "$$Dockerfile" > Dockerfile&&docker build -t $(image) .
build:Dockerfile;docker build --no-cache -t $(image) .
clean:;rm -rf Dockerfile

