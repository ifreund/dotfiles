#!/bin/sh

case "$1" in
dark|light)
	for path in $(find "${XDG_RUNTIME_DIR}" -name "rijan-*"); do
		echo "(do (merge-into config ${1}) (:manage-dirty (registry :rwm)))" | \
			janet-netrepl -U "${path}" -c
	done
	;;
default) exit 1 ;;
esac
