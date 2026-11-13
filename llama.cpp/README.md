# llama.app 1.0.0

## The source

https://huggingface.co/blog/ggml-org/llama-cpp-v1

https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0

## My nix build

### GitHub

https://github.com/BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp

version:
```
nix run github:BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp -- cli --version
```
```
version: 1.0.0 (build 11669, commit 620d222)
built with Clang 21.1.8 for Darwin arm64
```

cli
```
nix run github:BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp -- cli -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0
```
```


Loading model...  

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b11669-620d222
model      : ggml-org/gemma-4-12B-it-GGUF:Q8_0
ftype      : Q8_0
modalities : text, vision, audio, video

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern
  /image <file>       add an image file
  /audio <file>       add an audio file
  /video <file>       add a video file



> 
```

serve
```
nix run github:BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp  -- serve -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0 --port 8080
```
```
...
0.04.791.192 I srv  server_on_li: listening on http://127.0.0.1:8080
```

### Flakehub

https://flakehub.com/flake/BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp?view=readme

version
```
nix run "https://flakehub.com/f/BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp/*" -- cli --version 
```
```
version: 1.0.0 (build 11669, commit 620d222)
built with Clang 21.1.8 for Darwin arm64
```

cli
```
nix run "https://flakehub.com/f/BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp/*" -- cli -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0
```
```


Loading model...  

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b11669-620d222
model      : ggml-org/gemma-4-12B-it-GGUF:Q8_0
ftype      : Q8_0
modalities : text, vision, audio, video

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern
  /image <file>       add an image file
  /audio <file>       add an audio file
  /video <file>       add a video file



> 
```

serve
```
nix run "https://flakehub.com/f/BaseLayer-AI/baselayer-ai-aarch64-darwin-llama-cpp/*" -- serve -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0 --port 8080
```
```
...
0.03.849.090 I srv  server_on_li: listening on http://127.0.0.1:8080
```

## Local build 

```
make build
```

https://ontouchstart.github.io/llama.cpp/build.1.log

```
make version
```
```
build/bin/llama version
version: 1.0.0-dev (build 12359, commit b1b770d90)
built with AppleClang 21.0.0.21000334 for Darwin arm64
```

```
make cli
build/bin/llama cli -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0


Loading model...  

▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀

build      : b12359-b1b770d90
model      : ggml-org/gemma-4-12B-it-GGUF:Q8_0
ftype      : Q8_0
modalities : text, vision, audio, video

available commands:
  /exit or Ctrl+C     stop or exit
  /regen              regenerate the last response
  /clear              clear the chat history
  /read <file>        add a text file
  /glob <pattern>     add text files using globbing pattern
  /image <file>       add an image file
  /audio <file>       add an audio file
  /video <file>       add a video file



> 
```

```
make serve
build/bin/llama serve -hf ggml-org/gemma-4-12B-it-GGUF:Q8_0 --port 8080
0.00.000.849 I srv  llama_server: initializing ...
...
0.03.597.079 I srv  server_on_li: listening on http://127.0.0.1:8080
```
