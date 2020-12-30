NAME=stns-container
VER=v0.1
CONTAINER_NAME=stns-server

build:
	sudo docker build -t $(NAME) .

run:
	sudo docker run -it --rm -p 1104:1104 --name $(COTAINER_NAME) $(NAME)

exec:
	sudo docker exec -it $(COTAINER_NAME) sh

push:
	sudo docker tag $(NAME) ghcr.io/cdsl-research/$(NAME)/$(NAME):$(VER)
	sudo docker push ghcr.io/cdsl-research/$(NAME)/$(NAME):$(VER)
