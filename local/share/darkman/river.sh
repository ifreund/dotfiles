#!/bin/sh

# https://protesilaos.com/emacs/modus-themes-colors
case "$1" in
dark)
	riverctl background-color 0x000000 # bg-main
	riverctl border-color-focused 0xffffff # fg-main
	riverctl border-color-unfocused 0x646464 # border
	riverctl border-color-urgent 0xff5f59 # red
	;;
light)
	riverctl background-color 0xffffff # bg-main
	riverctl border-color-focused 0x000000 # fg-main
	riverctl border-color-unfocused 0x9f9f9f # border
	riverctl border-color-urgent 0xa60000 # red
	;;
default) exit 1 ;;
esac
