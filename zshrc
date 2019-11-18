# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# Enable autocompletion and init prompt theme
autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

# use gpg-agent for ssh keys
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# A few defaults
export EDITOR=/bin/nvim
export AUR_PAGER=/bin/nnn

# nnn config
alias n=nnn
export NNN_USE_EDITOR=1                                 # use the $EDITOR when opening text files
export NNN_SSHFS_OPTS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_CONTEXT_COLORS="2136"                        # use a different color for each context
export NNN_TRASH=1                                      # trash (needs trash-cli) instead of delete

# CDDA Compile commands
alias cddamake-no-style="make -j12 NATIVE=linux64 LOCALIZE=0 CCACHE=1 DEBUG_SYMBOLS=1 ASTYLE=0 LINTJSON=0"
alias cddamake="make astyle && cddamake-no-style"
alias cddamake-tiles-no-style="cddamake-no-style TILES=1 BUILD_PREFIX=\"tiles-\""
alias cddamake-tiles="make astyle && cddamake-tiles-no-style"

alias cddamake-tiles-perf="make -j12 NATIVE=linux64 OTHERS=\"-Ofast -march=native\" RELEASE=1 LTO=1 TILES=1 LOCALIZE=0 CCACHE=1 ASTYLE=0 LINTJSON=0 USE_HOME_DIR=1 BUILD_PREFIX=perf-"
