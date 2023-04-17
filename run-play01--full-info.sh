#! /usr/bin/env bash

echo
echo "COLLECT FULL INFO FOR HOSTS."
echo "Enter the host or group value as it is configured in your inventory file."
echo "Enter 'hosts' value: "
read -r hosts

ansible-playbook -i inventory.yaml playbooks/play01--full-info.yaml \
  --extra-vars="hosts=$hosts"

