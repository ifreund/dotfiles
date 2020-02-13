#!/bin/sh
bonsai -n -L 20 -g 35,20 > /tmp/bonsai_fetch.txt
neofetch --ascii_colors 1 3 9 2 11 --ascii /tmp/bonsai_fetch.txt
