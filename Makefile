tag=v4.31.0
image=2026_06_22_git_lean4_llvm_nvim_flt:$(tag)
cmake=cmake -B lean4-build -S lean4 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM=ON
all:Dockerfile;docker run --rm $(image) bash -c 'make -C /opt/ answer FLT-build'
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
RUN echo 'FLT-build:FLT lean4-build;cd FLT&&lake build' >> Makefile

RUN mkdir FLT
RUN echo "leanprover/lean4:$(tag)" > FLT/lean-toolchain
RUN echo 'import Lake' > FLT/lakefile.lean
RUN echo 'open Lake DSL' >> FLT/lakefile.lean
RUN echo 'package "FLT"' >> FLT/lakefile.lean
RUN echo 'require "leanprover-community" / "mathlib" @ git "$(tag)"' >> FLT/lakefile.lean
RUN echo '@[default_target]' >> FLT/lakefile.lean
RUN echo 'lean_lib «FLT»' >> FLT/lakefile.lean

RUN echo 'import Mathlib.NumberTheory.FLT.Four' > FLT/FLT.lean
RUN echo '#check FermatLastTheorem.of_odd_primes' >> FLT/FLT.lean
RUN echo '-- identical' >> FLT/FLT.lean
RUN echo 'theorem FLT.of_odd_primes : (∀ (p : ℕ), Nat.Prime p → Odd p → FermatLastTheoremFor p) →' >> FLT/FLT.lean
RUN echo '  FermatLastTheorem :=' >> FLT/FLT.lean
RUN echo 'fun hprimes _ h =>' >> FLT/FLT.lean
RUN echo '  Or.casesOn (Nat.four_dvd_or_exists_odd_prime_and_dvd_of_two_lt h)' >> FLT/FLT.lean
RUN echo '    (fun hdvd => FermatLastTheoremWith.mono hdvd fermatLastTheoremFour) fun h =>' >> FLT/FLT.lean
RUN echo '    Exists.casesOn h fun p h =>' >> FLT/FLT.lean
RUN echo '      And.casesOn h fun hpprime right =>' >> FLT/FLT.lean
RUN echo '        And.casesOn right' >> FLT/FLT.lean
RUN echo '        fun hdvd hpodd =>' >> FLT/FLT.lean
RUN echo '        FermatLastTheoremWith.mono hdvd (hprimes p hpprime hpodd)' >> FLT/FLT.lean
RUN echo '#check FLT.of_odd_primes' >> FLT/FLT.lean

RUN make FLT-build
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
