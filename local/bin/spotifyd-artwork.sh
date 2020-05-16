#!/bin/sh

url=$(dbus-send --print-reply --dest="org.mpris.MediaPlayer2.spotifyd" \
	"/org/mpris/MediaPlayer2" org.freedesktop.DBus.Properties.Get \
	string:"org.mpris.MediaPlayer2.Player" string:"Metadata" \
	| grep -A 1 artUrl | tail -n 1 \
	| sed 's/^.*string //' | sed 's/"//g' )
wget -O /tmp/spotifyd_art.jpeg "$url"
