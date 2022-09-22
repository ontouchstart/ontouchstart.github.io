NAME=mvp-hello-react

all: 	test

bash:	up
	-docker exec -it $(NAME) bash
	make down

test:
	make up
	sleep 10
	curl -i http://localhost:3000
	make down

up: 	image
	docker run --rm -p 3000:3000 --name $(NAME) -d -t $(NAME)

down:
	docker rm -f $(NAME)

clean:
	docker rmi $(NAME)

image: 
	docker build --tag $(NAME) .

