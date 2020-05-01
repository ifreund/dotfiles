# .zshrc

# setup path
path=("$HOME/.local/bin" $path)
# cargo why are you dumb
path=("$HOME/.cargo/bin" $path)
export PATH

export GPG_TTY=$(tty)

# essentially syncs history between shells
setopt INC_APPEND_HISTORY
# when adding a new entry to history remove any currently present duplicate
setopt HIST_IGNORE_ALL_DUPS
# don't record lines starting with a space in the history
setopt HIST_IGNORE_SPACE

HISTFILE=${XDG_DATA_HOME:-$HOME/.local/share}/.histfile
HISTSIZE=10000
SAVEHIST=10000

# disable ctrl-S/ctrl-Q for START/STOP
stty -ixon -ixoff

# vi bindings
bindkey -v

# ergonomic homerow beginning and end of line bindings
bindkey -M vicmd H vi-beginning-of-line
bindkey -M vicmd L vi-end-of-line

# reduce delay entering vi mode to 0.1 s
KEYTIMEOUT=1

# init some custom behavior
source $ZDOTDIR/better_ctrl_z.zsh
source $ZDOTDIR/vi_modal_cursor.zsh

# add completion functions from zsh-completions packages to fpath so compinit
# can find them
fpath=(/usr/share/zsh/site-functions $fpath)
# initialize completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# allow completion of hidden files
_comp_options+=(globdots)

# intialize autosuggestions plugin with base01 as color and ctrl-N to accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^n' autosuggest-accept

# initalize jump
eval "$(zoxide init --z-cmd j zsh)"

# load aliases
source $ZDOTDIR/aliases.zsh

# get colorful man pages with less
source $ZDOTDIR/man.zsh

# initalize powerlevel10k prompt
source ~/projects/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/p10k.zsh

# initalize syntax highlighting and customize colors
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=2' # green
ZSH_HIGHLIGHT_STYLES[precommand]='fg=2' # green
ZSH_HIGHLIGHT_STYLES[path]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[globbing]='fg=3' # yellow
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=12' # base0
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=6' # cyan
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=9' # orange
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=1' # red
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=1' # red
ZSH_HIGHLIGHT_STYLES[redirection]='fg=2' # green

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
