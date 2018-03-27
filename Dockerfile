# https://github.com/philm/ansible_playbook/blob/10d053b4e78ba9e39c21f0634322ba84b2f31e64/Dockerfile
FROM gliderlabs/alpine:3.3

ARG ANSIBLE_VERSION=v2.4.3.0-1

RUN \
  apk-install \
    curl \
    openssh-client \
    python \
    py-boto \
    py-dateutil \
    py-httplib2 \
    py-jinja2 \
    py-paramiko \
    py-pip \
    py-setuptools \
    py-yaml \
    tar && \
  pip install --upgrade pip python-keyczar && \
  rm -rf /var/cache/apk/*

RUN mkdir /etc/ansible/ /ansible
RUN echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

COPY files/proteus_hosts.txt /etc/ansible/proteus_hosts

RUN cat /etc/ansible/proteus_hosts >> /etc/ansible/hosts

RUN \
  curl -fsSL https://github.com/ansible/ansible/archive/$ANSIBLE_VERSION.tar.gz -o ansible.tar.gz && \
  tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib

ENTRYPOINT ["ansible-playbook"]
