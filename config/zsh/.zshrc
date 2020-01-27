# .zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this, everything else may go below.
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# essentially syncs history between shells
setopt INC_APPEND_HISTORY
# when adding a new entry to history remove any currently present duplicate
setopt HIST_IGNORE_ALL_DUPS

HISTFILE=${XDG_DATA_HOME:-$HOME/.local/share}/.histfile
HISTSIZE=10000
SAVEHIST=10000

# vi bindings
bindkey -v

# ergonomic homerow beginning and end of line bindings
bindkey -M vicmd H vi-beginning-of-line
bindkey -M vicmd L vi-end-of-line

# reduce delay entering vi mode to 0.1 s
KEYTIMEOUT=1

# enable fancy zsh autocompletion
autoload -Uz compinit
compinit

# use gpg-agent for ssh keys
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# initalize autojump
source /usr/share/autojump/autojump.zsh

# load aliases
source $ZDOTDIR/.aliases.zsh

# use the powerlevel10k prompt
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt edit .p10k.zsh.
source $ZDOTDIR/.p10k.zsh
