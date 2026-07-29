github=https://github.com
owner=ggml-org
repo=llama.cpp
release=b10182

chinese: build
	build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --prompt "Print random number of random Chinese characters in one line without spaces." --single-turn

server:	build
	# https://huggingface.co/ggml-org/gemma-4-12B-it-GGUF
	# build/bin/llama-server -hf ggml-org/gemma-4-12B-it-GGUF
	build/bin/llama-server --models-dir models

build:	$(repo)
	cmake -B build -S $(repo)
	cmake --build build --config Release

$(repo):
	git clone -b $(release) $(github)/$(owner)/$(repo).git

clean:
	rm -rf $(repo) build
