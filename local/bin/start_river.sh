#!/bin/sh

export XKB_DEFAULT_OPTIONS="caps:escape"
[ "$1" = "cole" ] && export XKB_DEFAULT_LAYOUT="us(colemak)"

river -l 7 -c ~/.config/river/config.sh
