install:
	uv add "fastapi[standard]"
	uv add mlx-lm 
	uv add sentencepiece

server:
	uv run fastapi dev main.py

test: # run server in another terminal first
	curl -s 'http://127.0.0.1:8000/tokens?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-chatGPT-tokens.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-generate.json
