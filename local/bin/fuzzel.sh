#!/bin/sh

# <&0 redirects stdin (fd 0) to fuzzel's stdin
fuzzel -T footclient -w 64 -b 002b36ff -t 839496ff \
	-m dc322fff -s 073642ff -B 2 -r 0 -C 839496ff --filter-desktop $@ <&0
