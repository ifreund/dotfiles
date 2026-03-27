#!/bin/sh

case "$1" in
dark)
	echo "initial-color-theme=dark" > ~/.config/foot/colors.ini
	killall -s SIGUSR1 foot ;;
light)
	echo "initial-color-theme=light" > ~/.config/foot/colors.ini
	killall -s SIGUSR2 foot ;;
default) exit 1 ;;
esac
