#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Mod4"

# term/close/exit
riverctl map normal $mod+Shift Return spawn alacritty
riverctl map normal $mod Q close
riverctl map normal $mod E exit

# launcher
riverctl map normal $mod D spawn launcher.sh

# view focus
riverctl map normal $mod Return zoom
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# master count/size
riverctl map normal $mod H mod-master-factor -0.05
riverctl map normal $mod L mod-master-factor +0.05
riverctl map normal $mod+Shift H mod-master-count +1
riverctl map normal $mod+Shift L mod-master-count -1

# toggle float/fullscreen
riverctl map normal $mod Space toggle-float
riverctl map normal $mod F toggle-fullscreen

# multi-output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

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
riverctl map normal $mod F11 enter-mode passthrough
riverctl map passthrough $mod F11 enter-mode normal

# 8px padding
riverctl set-option outer_padding 4
riverctl set-option view_padding 4

# start waybar
riverctl spawn ~/projects/Waybar/build/waybar -c ~/.config/waybar/config_river -s ~/.config/waybar/style_river.css
