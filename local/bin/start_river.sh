#!/bin/sh

export MOZ_ENABLE_WAYLAND=1

timestamp=$(date +%F-%R)
exec dbus-run-session river -l 6 > ~/river-${timestamp}.log 2>&1
