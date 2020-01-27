# .zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# vi bindings
bindkey -v

# reduce delay entering vi mode to 0.1 s
export KEYTIMEOUT=1

# initalize autojump
source /usr/share/autojump/autojump.zsh

# enable fancy zsh autocompletion
autoload -Uz compinit
compinit

# use gpg-agent for ssh keys
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# shortcut aliases
alias ls="exa"
alias n="nnn"
alias paste="curl --data-binary @- https://paste.rs/"
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
alias sdm="sudo systemd-mount"
alias sdum="sudo systemd-umount"

# CDDA Compile commands
cddamake_common="make -j14 NATIVE=linux64 CCACHE=1 LOCALIZE=0"
alias cddamake-no-style="$cddamake_common DEBUG_SYMBOLS=1 ASTYLE=0 LINTJSON=0 \
    OTHERS=-fdiagnostics-color"
alias cddamake="make astyle && cddamake-no-style"
alias cddamake-tiles-no-style="cddamake-no-style TILES=1 BUILD_PREFIX=\"tiles-\""
alias cddamake-tiles="make astyle && cddamake-tiles-no-style"
alias cddamake-tiles-perf="$cddamake_common OTHERS=\"-Ofast -march=native \
    -fdiagnostics-color\" RELEASE=1 LTO=1 TILES=1 ASTYLE=0 LINTJSON=0 \
    USE_XDG_DIR=1 BUILD_PREFIX=perf-"

# use the powerlevel10k prompt
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt edit .p10k.zsh.
source $ZDOTDIR/.p10k.zsh
