#! /usr/bin/env bash

echo
echo "PERFORM ROOT INSTALLATIONS AND SETUP."

echo
echo "Enter the host value for the managed node for which to install packages and libraries and perform setup."
echo "Enter 'instance_for_installs' value: "
read -r instance_for_installs


ansible-playbook -i inventory.yaml playbooks/play04--ec2-root-installations-and-setup.yaml \
  --extra-vars="instance_for_installs=$instance_for_installs"

