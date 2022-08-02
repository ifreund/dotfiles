#!/bin/sh

timestamp=$(date +%F-%R)
setsid -f sh -c "waylock > /tmp/waylock-${timestamp}.log 2>&1" \
