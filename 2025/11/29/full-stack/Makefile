install:
	uv add "fastapi[standard]" pydantic
	uv add mlx-lm pytest-playwright 
	uv run main.py

server:
	uv run fastapi dev server.py

test:
	uv run pytest test.py
	curl -s -X 'GET' 'http://127.0.0.1:8000/tokens?prompt=What%20is%20FastAPI%3F' -H 'accept: application/json' | jq . | tee get_tokens.json
	curl -s -X 'GET' 'http://127.0.0.1:8000/generate?prompt=What%20is%20FastAPI%3F' -H 'accept: application/json' | jq . | tee get_generate.json
	curl -s -X 'POST' 'http://127.0.0.1:8000/tokens' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{ "content": "What is ChatGPT?" }' | jq . | tee post_tokens.json
	curl -s -X 'POST' 'http://127.0.0.1:8000/generate' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{ "content": "What is ChatGPT?" }' | jq . | tee post_generate.json
