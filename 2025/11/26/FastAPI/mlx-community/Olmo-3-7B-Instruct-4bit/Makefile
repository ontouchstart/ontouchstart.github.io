install:
	uv add "fastapi[standard]"
	uv add mlx-lm 
	uv run main.py	

server:
	uv run fastapi dev server.py

test: # run server in another terminal first

	curl -s 'http://127.0.0.1:8000/tokens?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-tokens.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-generate.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=Translate%20this%20to%20Chinese:%20What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-chinese-generate.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=Translate%20this%20from%20latin%20to%20Chinese:Carpe%20Diem' | jq . | tee carpe-diem-chinese-generate.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b1=?' | jq  . | tee one-plus-one.json
