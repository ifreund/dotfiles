# if this session isn't interactive, do nothing and exit
if not status --is-interactive
    exit
end

# if running from tty1 start sway
if test (tty) = "/dev/tty1"
    # For debugging:
    # exec sway -d 2> ~/sway.log

    # env var to run firefox through wayland
    set --export MOZ_ENABLE_WAYLAND 1
    exec sway
end

# clear the greeting
set -U fish_greeting

# set up vi keybindings
set -U fish_key_bindings fish_vi_key_bindings
set -U fish_escape_delay_ms 10

# these are my preferred homerow replacements for 0 and $
bind -s -M default H beginning-of-line
bind -s -M default L end-of-line
bind -s -M visual H beginning-of-line
bind -s -M visual L end-of-line

# bind ctrl-N to accept the autosuggestion
bind -s -M insert \cn accept-autosuggestion

# init autojump
source /usr/share/autojump/autojump.fish

# init the starship prompt
starship init fish | source
