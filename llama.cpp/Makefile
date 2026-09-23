github=https://github.com
owner=ggml-org
repo=llama.cpp
release=v0.5.0
llama=build/bin/llama

version: build
	$(llama) version 1> version.1.log 2> version.2.log

server:	build
	$(llama) server --models-dir models -m models/gemma-4-12B-it-Q8_0.gguf

build:	$(repo)
	cmake -B build -S $(repo)
	cmake --build build --config Release 1> build.1.log 2> build.2.log

$(repo):
	git clone -b $(release) $(github)/$(owner)/$(repo).git

clean:
	rm -rf $(repo) build

download:
	uv run hf download --local-dir models ggml-org/gemma-4-E2B-it-GGUF
	uv run hf download --local-dir models ggml-org/gemma-4-E4B-it-GGUF
	uv run hf download --local-dir models ggml-org/gemma-4-12B-it-GGUF
