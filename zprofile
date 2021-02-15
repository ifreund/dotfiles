# .zprofile

export XDG_CONFIG_HOME="${HOME}/.config"
export CRAWL_DIR="${XDG_CONFIG_HOME}/crawl/"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/config"
export WEECHAT_HOME="${XDG_CONFIG_HOME}/weechat"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export JANET_PATH="${HOME}/.local/lib/janet"
export JANET_BINPATH="${HOME}/.local/bin"

export C_INCLUDE_PATH="${HOME}/.local/include"
export LD_LIBRARY_PATH="${HOME}/.local/lib"
export PKG_CONFIG_PATH="${HOME}/.local/lib/pkgconfig"
export MANPATH="${HOME}/.local/share/man:/usr/share/man:"

# setup path
path=("$HOME/.local/bin" $path)
# cargo why are you dumb
path=("$HOME/.cargo/bin" $path)
export PATH

export EDITOR=kak
export VISUAL=kak

# if not in a wayland session and running from tty1, start river
if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
	exec start_river.sh
fi
