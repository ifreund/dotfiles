#!/bin/sh
device_name=$(lsblk -o NAME,SIZE,MODEL -l | tail -n +2 | tr -s ' ' | fuzzel.sh -d 2> /dev/null | cut -d ' ' -f 1)
[ -n "${device_name}" ] || exit 1
mount_point=~/mnt/${device_name}
mkdir -p ${mount_point} || exit 1
printf "mounting /dev/%s to %s\n" ${device_name} ${mount_point}
doas mount /dev/${device_name} ${mount_point}
