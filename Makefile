
.PHONY: all build


all: build

build:
	docker build -f Dockerfile -t quay.io/bthomass/ansible-rulebook:drools .

run:
	docker run -it quay.io/bthomass/ansible-rulebook:drools ansible-rulebook

shell:
	docker run -it  quay.io/bthomass/ansible-rulebook:drools /bin/bash

push:
	docker push quay.io/bthomass/ansible-rulebook:drools
