# Ansible docker

##### Maintainers
* @rosario.priego@gmail.com

## Arrancar el contenedor
Construir el contenedor
```
  docker build -t rows/ansible .

```
## Arrancar el contenedor y lanzar playbook de test

```
  docker run --rm -it -v $(pwd):/ansible/playbooks \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  rows/ansible ansible_playbook/test/testPing.yaml

```
## Lanzar playbooks
