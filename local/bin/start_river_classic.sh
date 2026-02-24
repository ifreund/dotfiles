#!/bin/sh

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=river

timestamp=$(date +%F-%R)
exec ~/repos/river-classic/zig-out/bin/river -c ~/.config/river/init-classic -log-level debug > /tmp/river-${timestamp}.log 2>&1
