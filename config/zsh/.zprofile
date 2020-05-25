# if not in a wayland session and running from tty1, start sway
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
	# run firefox with wayland backend
	export MOZ_ENABLE_WAYLAND=1
	export XDG_CURRENT_DESKTOP=sway
	export XDG_SESSION_TYPE=wayland

	exec dbus-run-session sway

	# For debugging:
	# exec sway -d 2> ~/sway.log
fi
