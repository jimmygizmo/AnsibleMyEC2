#! /usr/bin/env bash

echo
echo "DEFAULT TEST PLAYBOOK - PRINTS A TEST MESSAGE."
echo "This playbook performs no actions and simply prints a test message on localhost."
echo "Press enter to run to run the default test playbook: "
read -r unused_var__press_enter

ansible-playbook -i inventory.yaml playbooks/play00--default-test.yaml

