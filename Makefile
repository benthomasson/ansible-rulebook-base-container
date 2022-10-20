
.PHONY: all build


all: build

build:
	docker build -f Dockerfile -t quay.io/ansible/ansible-rulebook:latest .

run:
	docker run -it quay.io/ansible/ansible-rulebook:latest ansible-rulebook

shell:
	docker run -it  quay.io/ansible/ansible-rulebook:latest /bin/bash

push:
	docker push quay.io/ansible/ansible-rulebook:latest
