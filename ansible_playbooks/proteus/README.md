# Execute ansible playbooks by Docker

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

## Descargar la imagen desde el repositorio privado de treelogic
```
  docker pull 192.168.3.202:18444/proteus/ansible
```


## Lanzar playbooks
```
  docker run --rm -it -v $(pwd):/ansible/playbooks  \
                      -v ~/.ssh/id_rsa:/root/.ssh/id_rsa  \
                      -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub   \
                      proteus/ansible \
                      ansible_playbooks/proteus/01_proteus_restart_platform.yml

```
