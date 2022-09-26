env: 	
	make -C environment

test:
	make -C github test

up: 	
	make -C httpd image	
	docker run --rm -p 8080:80 -d -v `pwd`/ontouchstart.github.io:/var/www/html --name httpd -it httpd

down:
	docker rm -f httpd

clean:
	make -C httpd clean
