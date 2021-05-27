#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook ansible/aws-terra-play.yaml

ansible-playbook -i ansible/inventory/aws-inventory.ini ansible/aws-ins-config.yaml

ansible-playbook ansible/ibm-terra-play.yaml
