up:	uv-docker-example
	cd uv-docker-example && docker compose up -d --wait

down:	uv-docker-example
	cd uv-docker-example && docker compose down

uv-docker-example:
	git clone https://github.com/astral-sh/uv-docker-example.git

clean:
	rm -rf uv-docker-exmaple

test:
	curl -s http://localhost:8000
