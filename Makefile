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
	make up
	curl -i http://localhost:8080
	make down


up: 	
	make -C httpd image	
	docker run --rm -p 8080:80 -d -v `pwd`/ontouchstart.github.io:/var/www/html --name httpd -it httpd

down:
	docker rm -f httpd

clean:
	make -C httpd clean
