tag=4.31.0
image=2026_06_17_lean4_nvim_answer:$(tag)
answer:Dockerfile;docker run --rm $(image) bash -c 'make -C /opt/ answer'
bash:Dockerfile;docker run --rm -it $(image)
test:Dockerfile;docker run --rm $(image) bash -c 'make -C /opt/lean4-$(tag)/build/release test'

define Dockerfile
FROM debian:13-slim
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl git libgmp-dev libuv1-dev libssl-dev cmake ccache clang pkgconf
WORKDIR /opt
RUN curl -sLO https://github.com/leanprover/lean4/archive/refs/tags/v$(tag).tar.gz
RUN tar -xzvf v$(tag).tar.gz 
RUN echo "def answer := 42\\n#eval answer\\n" > answer.lean
RUN echo "answer:lean4-$(tag)/build;lean answer.lean" > Makefile
RUN echo "lean4-$(tag)/build:lean4-$(tag);cd lean4-$(tag)&&cmake --preset release&&make -C build/release install -j$$(nproc)" >> Makefile
RUN make
RUN git clone -b v0.12.3 --depth=1 https://github.com/neovim/neovim.git
WORKDIR /opt/neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
RUN make install
RUN mkdir -p /root/.config/nvim/
RUN echo 'vim.pack.add { "https://github.com/Julian/lean.nvim" }' > /root/.config/nvim/init.lua
RUN echo 'require("lean").setup { mappings = true }' >> /root/.config/nvim/init.lua
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
