# if running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    # For debugging:
    # exec sway -d 2> ~/sway.log

    # env var to run firefox through wayland
    MOZ_ENABLE_WAYLAND=1 sway
fi
