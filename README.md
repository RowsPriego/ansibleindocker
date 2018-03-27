# Ansible docker for Proteus

##### Maintainers
* @rosario.priego@treelogic.com

## Arrancar el contenedor
Construir el contenedor
```
  docker build -t proteus/ansible .

```
## Arrancar el contenedor y lanzar playbook de test

```
  docker run --rm -it -v $(pwd):/ansible/playbooks \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
  proteus/ansible files/testPing.yaml

```
## Lanzar playbooks
