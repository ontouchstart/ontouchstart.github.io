NAME=facebook-react

bash:	image
	docker run --rm -p 3000:3000 --name $(NAME) -it $(NAME) bash

test:	image
	docker run --rm --name $(NAME) -it $(NAME) yarn test

clean:
	docker rmi $(NAME)

image: 
	docker build --tag $(NAME) .

