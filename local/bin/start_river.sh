#!/bin/sh

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=river

timestamp=$(date +%F-%R)
exec river -log-level debug > /tmp/river-${timestamp}.log 2>&1
