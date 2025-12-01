# download and compile llama.cpp
llama.cpp: 
	git clone https://github.com/ggml-org/llama.cpp.git
	cd llama.cpp && cmake -B build && cmake --build build --config Release -j 8

# run server
server: llama.cpp
	# download the gguf model and save to ~/gguf/
	./llama.cpp/build/bin/llama-server -m ~/gguf/gpt-oss-20b-mxfp4.gguf --ctx-size 0 --jinja -ub 2048 -b 2048
