#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# use gpg-agent for ssh keys
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# tab completion
source /usr/share/bash-completion/completions/git


# CDDA Compile commands
alias cddamake-no-style="make -j12 NATIVE=linux64 CXXFLAGS=\"-march=native\" RELEASE=1 LOCALIZE=0 CCACHE=1 LTO=1 ASTYLE=0 LINTJSON=0"
alias cddamake="make astyle && cddamake-no-style"
alias cddamake-tiles-no-style="cddamake-no-style TILES=1 BUILD_PREFIX=\"tiles-\""
alias cddamake-tiles="make astyle && cddamake-tiles-no-style"
