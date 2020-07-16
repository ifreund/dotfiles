# .zprofile

# setup path
path=("$HOME/.local/bin" $path)
# cargo why are you dumb
path=("$HOME/.cargo/bin" $path)
export PATH

# if not in a wayland session and running from tty1, start river
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
	exec start_river.sh
fi
