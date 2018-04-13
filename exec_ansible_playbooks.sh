#!/usr/bin/env bash
# Parameter 1: path of the playbook

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters. Usage: exec_ansible_playbook.sh <playbook_path>"
    exit 1
fi

docker run --rm -it -v $(pwd):/ansible/playbooks   -v ~/.ssh/id_rsa:/root/.ssh/id_rsa   -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub   proteus/ansible $1
