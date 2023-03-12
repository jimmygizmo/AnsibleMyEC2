#! /usr/bin/env bash

echo
echo "FORMAT AND MOUNT THE NEW PERSISTENT VOLUME OF A NEW EC2 INSTANCE."
echo "This playbook successfully formats and mounts but does not yet configure auto-re-mounting via fstab."
echo "** The manual steps for this task are well proven and documented in this project in the following file:"
echo "**** See: playbooks/todo--play03--mount-vol-to-ec2.txt"

echo
echo "Enter the host value for the managed node for which to format and mount the new attached volume."
echo "Enter 'format_mount_vol_host' value: "
read -r format_mount_vol_host


ansible-playbook -i inventory.yaml playbooks/play03--mount-vol-to-ec2.yaml \
  --extra-vars="format_mount_vol_host=$format_mount_vol_host"

