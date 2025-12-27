# 2025/12/27 Code Review

- [code_review_medium.py](code_review_medium.py)
- [code_review_medium](code_review_medium)


```
% make
rm -rf uv.lock .venv
uv add ruff pytest 
Using CPython 3.14.2
Creating virtual environment at: .venv
Resolved 33 packages in 233ms
Installed 31 packages in 97ms
 + ask-mlx-lm==0.1.0 (from git+https://github.com/ontouchstart/ontouchstart.github.io@0add53371a1d38bac5a7d331ab478f92e79e43b2)
 + certifi==2025.11.12
 + charset-normalizer==3.4.4
 + filelock==3.20.1
 + fsspec==2025.12.0
 + hf-xet==1.2.0
 + huggingface-hub==0.36.0
 + idna==3.11
 + iniconfig==2.3.0
 + jinja2==3.1.6
 + markupsafe==3.0.3
 + mlx==0.30.1
 + mlx-lm==0.29.1
 + mlx-metal==0.30.1
 + numpy==2.4.0
 + packaging==25.0
 + pluggy==1.6.0
 + protobuf==6.33.2
 + pygments==2.19.2
 + pytest==9.0.2
 + pyyaml==6.0.3
 + regex==2025.11.3
 + requests==2.32.5
 + ruff==0.14.10
 + safetensors==0.7.0
 + sentencepiece==0.2.1
 + tokenizers==0.22.1
 + tqdm==4.67.1
 + transformers==4.57.3
 + typing-extensions==4.15.0
 + urllib3==2.6.2
uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@ask_mlx_lm" --no-cache
Resolved 33 packages in 1ms
Audited 31 packages in 8ms
uv run ruff check
All checks passed!
uv run ruff format
3 files left unchanged
% make
make grrs
cargo install --git https://github.com/ontouchstart/ontouchstart.github.io --branch grrs grrs --root .cargo
    Updating git repository `https://github.com/ontouchstart/ontouchstart.github.io`
  Installing grrs v0.1.0 (https://github.com/ontouchstart/ontouchstart.github.io?branch=grrs#f7921861)
    Updating crates.io index
     Locking 21 packages to latest Rust 1.91.1 compatible versions
   Compiling proc-macro2 v1.0.104
   Compiling unicode-ident v1.0.22
   Compiling quote v1.0.42
   Compiling utf8parse v0.2.2
   Compiling anstyle-query v1.1.5
   Compiling is_terminal_polyfill v1.70.2
   Compiling anstyle v1.0.13
   Compiling colorchoice v1.0.4
   Compiling clap_lex v0.7.6
   Compiling strsim v0.11.1
   Compiling anstyle-parse v0.2.7
   Compiling heck v0.5.0
   Compiling anstream v0.6.21
   Compiling clap_builder v4.5.53
   Compiling syn v2.0.111
   Compiling clap_derive v4.5.49
   Compiling clap v4.5.53
   Compiling grrs v0.1.0 (/Users/sam/.cargo/git/checkouts/ontouchstart.github.io-f66ada82c79ac682/f792186/grrs)
    Finished `release` profile [optimized] target(s) in 4.78s
  Installing .cargo/bin/grrs
   Installed package `grrs v0.1.0 (https://github.com/ontouchstart/ontouchstart.github.io?branch=grrs#f7921861)` (executable `grrs`)
warning: be sure to add `.cargo/bin` to your PATH to be able to run the installed binaries
.cargo/bin/grrs some-pattern Makefile
	-.cargo/bin/grrs some-pattern Makefile
rm -rf .cargo
```
