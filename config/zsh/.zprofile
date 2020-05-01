if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 700 "${XDG_RUNTIME_DIR}"
    fi
fi

# if not in a wayland session and running from tty1, start sway
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
    # run firefox with wayland backend
    export MOZ_ENABLE_WAYLAND=1

    exec sway

    # For debugging:
    # exec sway -d 2> ~/sway.log
fi
