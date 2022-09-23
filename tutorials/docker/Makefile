test:	up
	sleep 10
	curl http://localhost:8000
	make down
	make clean

inspect: build
	docker inspect docker101tutorial

sh:	up
	docker exec -it docker-tutorial sh
	make down

build:	getting-started
	cd getting-started && docker build -t docker101tutorial .

up:	inspect
	docker run -d -p 8000:80 --name docker-tutorial docker101tutorial

down:
	docker rm -f docker-tutorial

getting-started:
	docker inspect alpine/git
	docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
	docker inspect repo
	docker cp repo:/git/getting-started .
	docker rm -f repo

clean:
	rm -rf getting-started
