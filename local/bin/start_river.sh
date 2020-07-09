#!/bin/sh

export XKB_DEFAULT_OPTIONS="caps:escape"
export XKB_DEFAULT_LAYOUT="us(colemak)"

export MOZ_ENABLE_WAYLAND=1

river -l 7 -c ~/.config/river/config.sh
