install:
	uv add "fastapi[standard]"
	uv add mlx-lm pytest-playwright
	uv run main.py	

server:
	uv run fastapi dev server.py

test:   # run server in another terminal first
	curl -s 'http://127.0.0.1:8000/tokens?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-tokens.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-generate.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=Translate%20this%20to%20Chinese:%20What%20is%20ChatGPT?' | jq . | tee what-is-ChatGPT-chinese-generate.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=Translate%20this%20from%20latin%20to%20Chinese:Carpe%20Diem' | jq . | tee carpe-diem-chinese-generate.json

math_test:
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%20=%20?' | jq  . | tee sum-1-2.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%20=%20?' | jq  . | tee sum-1-3.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%20=%20?' | jq  . | tee sum-1-4.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%20=%20?' | jq  . | tee sum-1-5.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%2b6%20=%20?' | jq  . | tee sum-1-6.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%2b6%2b7%20=%20?' | jq  . | tee sum-1-7.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%2b6%2b7%2b8%20=%20?' | jq  . | tee sum-1-8.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%2b6%2b7%2b8%2b9%20=%20?' | jq  . | tee sum-1-9.json
	curl -s 'http://127.0.0.1:8000/generate?prompt=1%2b2%2b3%2b4%2b5%2b6%2b7%2b8%2b9%2b10%20=%20?' | jq  . | tee sum-1-10.json

pytest: # run server in another terminal first
	uv run pytest test.py
