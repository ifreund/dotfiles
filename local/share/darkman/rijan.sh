#!/bin/sh

case "$1" in
dark|light) echo "(do (merge-into config ${1}) (:manage-dirty ((wm :registry) :rwm)))" | janet-netrepl -c ;;
default) exit 1 ;;
esac
