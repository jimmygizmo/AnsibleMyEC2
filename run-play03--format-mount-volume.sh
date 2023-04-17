#! /usr/bin/env bash

echo
echo "FORMAT AND MOUNT THE NEW PERSISTENT VOLUME OF A NEW EC2 INSTANCE."
echo "This playbook works well to format and mount but does not yet enable auto-re-mounting of the volume."
echo "TODO: The final piece of automation for this goal will edit the fstab file and compose the required entry."
echo "For the time being, if the instance is stopped and restarted, you will need to DO: sudo mount /dev/xvdb /data"
echo "TODO: In the interim, while the fstab solution in in the works, I will provide a simple Ansible remount play."
echo "For the required manual steps are in the following file:"
echo "**** See: playbooks/todo--play03--format-mount-volume.txt"

echo
echo "Enter the host value for the managed node for which to format and mount the new attached volume."
echo "Enter 'format_mount_vol_host' value: "
read -r format_mount_vol_host


ansible-playbook -i inventory.yaml playbooks/play03--format-mount-volume.yaml \
  --extra-vars="format_mount_vol_host=$format_mount_vol_host"


# TODO: Add safety checks so FORMAT is not attempted on a block device which already has a filesystem. The TODO file
# referenced above has checks for this, but those have not yet been automated in Ansible with the ability to stop
# the formatting process. This is coming soon. Ansible playbooks should have such safety checks in place at multiple
# levels and should be organized and designed to allow the correct sequence and context of usage. Automation must
# reduce the amount of manual work and never unintentionally create extra work because of misapplication of that
# automation. We need smart automation, so adding such checks is a priority for all of my Anisble work.

