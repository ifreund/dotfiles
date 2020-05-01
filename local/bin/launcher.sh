#!/bin/sh
target=$(dot-desktop | bemenu -i -p "exec:" --fn "cozette 10" --line-height 13 \
	--tb=#839496 --tf=#002b36 \
	--fb=#002b36 --ff=#839496 \
	--nb=#073642 --nf=#93a1a1 \
	--hb=#839496 --hf=#002b36)

swaymsg exec eval "$(dot-desktop "${target}")"
