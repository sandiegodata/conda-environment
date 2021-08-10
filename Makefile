
NS = sandiegodata.org
VERSION = latest

ENV = 
REPO = env_builder
NAME = env_builder
INSTANCE = default
DOCKER ?= docker
VOLUMES = -v $(shell pwd)/..:/opt/notebooks 
PORTS = -p 9888:9888 --expose 9888

IMAGE_NAME = $(NS)/$(REPO):$(VERSION) 


.PHONY: build push shell run start stop restart reload rm rmf release

# Build the sez image using the conda-linux environment, coppied from ../requirements
build:
	$(DOCKER) build -t $(IMAGE_NAME) . -f docker/Dockerfile
	
run:
	$(DOCKER) run --rm -ti --name $(NAME)  $(CAP)  $(PORTS) $(VOLUMES) $(ENV) $(IMAGE_NAME)

linux-env:
	$(DOCKER) run --rm -ti --name $(NAME)  $(CAP)  $(PORTS) $(VOLUMES) $(ENV) $(IMAGE_NAME) > build/conda-linux.yaml

local-env:
	bin/build.sh build/conda-$(shell uname -s).yaml

# Open a bash shell in the builder image
shell:
	$(DOCKER) run --rm -ti --name $(NAME)_shell  $(CAP) $(PORTS) $(VOLUMES) $(ENV) $(IMAGE_NAME) /bin/bash

rmf:
	$(DOCKER) rm -f $(NAME)

rm:
	$(DOCKER) rm $(NAME)

