github=https://github.com
owner=ggml-org
repo=llama.cpp
release=v0.9.0
llama=build/bin/llama

server:	build
	$(llama) server -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0 --port 8080

cli:	build
	$(llama) cli -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0

version: build
	$(llama) version 1> version.1.log 2> version.2.log

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
