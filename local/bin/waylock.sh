#!/bin/sh

timestamp=$(date +%F-%R:%S)

chayang || exit 1

export WAYLAND_DEBUG=1
waylock -fork-on-lock > /tmp/waylock-${timestamp}.log 2>&1
