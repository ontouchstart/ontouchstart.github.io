IMAGE=httpd

test:
	make up
	curl -i http://localhost:8080
	make down

up: 	image
	docker run --rm -p 8080:80 --name httpd -d -t $(IMAGE)

down:
	docker rm -f httpd

clean:
	docker rmi $(IMAGE)

image: 
	docker build --tag $(IMAGE) .

