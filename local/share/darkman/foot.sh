#!/bin/sh

case "$1" in
dark) killall -s SIGUSR1 foot ;;
light) killall -s SIGUSR2 foot ;;
default) exit 1 ;;
esac
