FROM quay.io/ansible/ansible-runner:latest
ARG ANSIBLE_GALAXY_CLI_COLLECTION_OPTS=
USER root
ENV PIP_NO_BINARY=jpy
RUN dnf install -y java-17-openjdk-devel maven
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
RUN dnf install -y gcc python38-devel
RUN pip3 install --upgrade pip setuptools
COPY requirements.yml /tmp/requirements.yml
RUN ansible-galaxy role install -r /tmp/requirements.yml --roles-path /usr/share/ansible/roles
RUN ansible-galaxy collection install $ANSIBLE_GALAXY_CLI_COLLECTION_OPTS -r /tmp/requirements.yml --collections-path /usr/share/ansible/collections
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
ADD . /runner/project
WORKDIR /runner/project

