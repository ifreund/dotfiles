#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=river

timestamp=$(date +%F-%R)
exec dbus-run-session river -l 6 > /tmp/river-${timestamp}.log 2>&1
