all: 	env test


env:
	cat /etc/os-release | cat -n
	apt list --installed 2>/dev/null | grep installed | cat -n
	set | grep -v TOKEN | cat -n
	env | grep -v TOKEN | cat -n
	set | grep TOKEN | cut -f1 -d= | cat -n
	env | grep TOKEN | cut -f1 -d= | cat -n

test:
	make -C httpd test

up: 	busybox-httpd-docker
	docker run --rm -p 8080:80 -d -v `pwd`/ontouchstart.github.io:/var/www/html --name basic-http-server -it basic-http-server

down:
	docker rm -f basic-http-server

busybox-httpd-docker:
	git clone https://github.com/stephenc/busybox-httpd-docker.git
	cd  busybox-httpd-docker && make image

clean:
	-docker rmi -f basic-http-server
	rm -rf busybox-httpd-docker
