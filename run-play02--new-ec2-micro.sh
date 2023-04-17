#! /usr/bin/env bash

echo
echo "CREATE A NEW EC2 INSTANCE."
echo "Enter the name to assign your new EC2 instance."
echo "Enter 'new_instance_name' value: "
read -r new_instance_name

echo
echo "Enter the subnet id of the subnet into which you wish to create your new EC2 instance."
echo "Enter 'new_instance_subnet_id' value: "
read -r new_instance_subnet_id

ansible-playbook -i inventory.yaml playbooks/play02--new-ec2-micro.yaml \
  --extra-vars="new_instance_name=$new_instance_name new_instance_subnet_id=$new_instance_subnet_id"

