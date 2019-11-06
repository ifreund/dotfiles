#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start the x if we didn't do that already and this is tty1
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  export QT_QPA_PLATFORMTHEME="qt5ct"
  exec startx
fi

