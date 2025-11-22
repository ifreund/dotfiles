#!/bin/sh

case "$1" in
dark) cp ~/.config/fuzzel/dark.ini ~/.config/fuzzel/colors.ini ;;
light) cp ~/.config/fuzzel/light.ini ~/.config/fuzzel/colors.ini ;;
default) exit 1 ;;
esac
