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
alias cddamake-no-style="make -j12 NATIVE=linux64 LOCALIZE=0 CCACHE=1 DEBUG_SYMBOLS=1 ASTYLE=0 LINTJSON=0"
alias cddamake="make astyle && cddamake-no-style"
alias cddamake-tiles-no-style="cddamake-no-style TILES=1 BUILD_PREFIX=\"tiles-\""
alias cddamake-tiles="make astyle && cddamake-tiles-no-style"

alias cddamake-tiles-perf="make -j12 NATIVE=linux64 OTHERS=\"-Ofast -march=native\" RELEASE=1 LOCALIZE=0 CCACHE=1 ASTYLE=0 LINTJSON=0 BUILD_PREFIX=perf-"

# colorize
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls='ls --color=auto'


# probably delete this perl stuff soon
PATH="/home/ifreund/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ifreund/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ifreund/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ifreund/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ifreund/perl5"; export PERL_MM_OPT;
