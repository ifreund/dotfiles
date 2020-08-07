#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Mod4"

# term/close
riverctl map normal $mod+Shift Return spawn footclient
riverctl map normal $mod Q close

# launcher
riverctl map normal $mod S spawn fuzzel.sh

# view focus
riverctl map normal $mod Return zoom
riverctl map normal $mod N focus-view next
riverctl map normal $mod E focus-view previous

# master count/size
riverctl map normal $mod H mod-master-factor -0.05
riverctl map normal $mod I mod-master-factor +0.05
riverctl map normal $mod+Shift H mod-master-count +1
riverctl map normal $mod+Shift I mod-master-count -1

# toggle float/fullscreen
riverctl map normal $mod Space toggle-float
riverctl map normal $mod F toggle-fullscreen

# multi-output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

# screenshots
riverctl map normal $mod P spawn 'grim -g "$(slurp)" - | wl-copy'

# tags
for i in $(seq 1 9); do
    tagmask=$((1 << ($i - 1)))
    riverctl map normal $mod $i set-focused-tags $tagmask
    riverctl map normal $mod+Shift $i set-view-tags $tagmask
    riverctl map normal $mod+Control $i toggle-focused-tags $tagmask
    riverctl map normal $mod+Shift+Control $i toggle-view-tags $tagmask
done
tags1to9=$(((1 << 9) - 1))
riverctl map normal $mod 0 set-focused-tags $tags1to9
riverctl map normal $mod+Shift 0 set-view-tags $tags1to9

# default layout
riverctl layout rivertile left

# passthrough mode for nested sessions
riverctl declare-mode passthrough
riverctl map normal $mod F12 enter-mode passthrough
riverctl map passthrough $mod F12 enter-mode normal

# 8px padding
riverctl outer-padding 4
riverctl view-padding 4

# cursor theme
riverctl xcursor-theme Adwaita

# float stuff with app_id "float"
riverctl float-filter-add float

# start long running programs
# TODO: use runit for supervision
riverctl spawn ~/projects/Waybar/build/waybar -c ~/.config/waybar/config_river -s ~/.config/waybar/style_river.css
riverctl spawn foot --server
