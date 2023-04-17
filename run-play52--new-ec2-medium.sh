#! /usr/bin/env bash

echo
echo "CREATE A NEW t2.medium EC2 INSTANCE."
echo "Enter the name to assign your new EC2 instance."
echo "Enter 'new_instance_name' value: "
read -r new_instance_name

echo
echo "Enter the subnet id of the subnet into which you wish to create your new EC2 instance."
echo "Enter 'new_instance_subnet_id' value: "
read -r new_instance_subnet_id

echo
echo "Enter the name of the Key Pair you wish to associate with the new EC2 instance."
echo "This is most likely the default/main Key Pair you use in your AWS VPC."
echo "Enter 'new_instance_key_name' value: "
read -r new_instance_key_name

ansible-playbook -i inventory.yaml playbooks/play52--new-ec2-medium.yaml \
  --extra-vars="new_instance_name=$new_instance_name new_instance_subnet_id=$new_instance_subnet_id new_instance_key_name=$new_instance_key_name"

