#!/bin/sh

case "$1" in
dark) COLORSCHEME=solarized-dark ;;
light) COLORSCHEME=modus-operandi ;;
default) exit 1 ;;
esac

echo "colorscheme ${COLORSCHEME}" > ~/.config/kak/autoload/colorscheme.kak

for session in $(kak -l | grep -v dead); do
	# This timeout usage prevents a hang in close() when targeting a
	# suspended kak session. The colorscheme command should still
	# get received by the target kak session since it is a very short
	# message that easily fits in the kernel's buffer.
	echo "colorscheme ${COLORSCHEME}" | timeout -k 1 1 kak -p "${session}"
done
