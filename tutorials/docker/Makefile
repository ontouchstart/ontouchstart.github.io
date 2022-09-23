getting-started:
	docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
	docker cp repo:/git/getting-started .

clean:
	docker rm -f repo
	rm -rf getting-started
