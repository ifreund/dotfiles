# if not in a wayland session and running from tty1, start sway
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
    # run firefox with wayland backend
    export MOZ_ENABLE_WAYLAND=1

    exec sway

    # For debugging:
    # exec sway -d 2> ~/sway.log
fi
