github=https://github.com
owner=ggml-org
repo=llama.cpp
release=b10516
llama=build/bin/llama

prompt="Print random number of random Chinese characters in one line without spaces."
chinese: build 
	$(llama) cli --model models/gemma-4-E2B-it-Q8_0.gguf --prompt $(prompt) --single-turn --output chinese-gemma-4-E2B-it.md
	$(llama) cli --model models/gemma-4-E4B-it-Q8_0.gguf --prompt $(prompt) --single-turn --output chinese-gemma-4-E4B-it.md
	$(llama) cli --model models/gemma-4-12B-it-Q8_0.gguf --prompt $(prompt) --single-turn --output chinese-gemma-4-12B-it.md

server:	build
	$(llama) server --models-dir models -m models/gemma-4-12B-it-Q8_0.gguf --ui-mcp-proxy

build:	$(repo)
	cmake -B build -S $(repo)
	cmake --build build --config Release

$(repo):
	git clone -b $(release) $(github)/$(owner)/$(repo).git

clean:
	rm -rf $(repo) build

download:
	uv run hf download --local-dir models ggml-org/gemma-4-E2B-it-GGUF
	uv run hf download --local-dir models ggml-org/gemma-4-E4B-it-GGUF
	uv run hf download --local-dir models ggml-org/gemma-4-12B-it-GGUF
