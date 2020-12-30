ALT_NAME=stns-container
VER=v0.1
CONTAINER_NAME=stns-server

build:
	sudo docker build -t $(CONTAINER_NAME) .

run:
	sudo docker run -it --rm -p 1104:1104 --name $(ALT_NAME) $(CONTAINER_NAME)

exec:
	sudo docker exec -it $(ALT_NAME) sh

push:
	sudo docker tag $(CONTAINER_NAME) docker.pkg.github.com/cdsl-research/stns-container/$(CONTAINER_NAME):$(VER)
	sudo docker push docker.pkg.github.com/cdsl-research/stns-container/$(CONTAINER_NAME):$(VER)
