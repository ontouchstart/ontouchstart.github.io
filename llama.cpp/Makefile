github=https://github.com
owner=ggml-org
repo=llama.cpp
release=b10152
42:	build
	# https://huggingface.co/ggml-org/gemma-4-E2B-it-GGUF
	build/bin/llama-cli -hf ggml-org/gemma-4-E2B-it-GGUF --prompt "What is the question to the answer of 42?" --single-turn

server:	build
	# https://huggingface.co/ggml-org/gemma-4-12B-it-GGUF
	build/bin/llama-server -hf ggml-org/gemma-4-12B-it-GGUF
pi-server:
	build/bin/llama-server --models-dir ~/models --no-models-autoload --jinja --host 127.0.0.1 --port 8080 -ngl 999 -c 32768

build:	$(repo)
	cmake -B build -S $(repo)
	cmake --build build --config Release

$(repo):
	git clone -b $(release) $(github)/$(owner)/$(repo).git

clean:
	rm -rf $(repo) build
