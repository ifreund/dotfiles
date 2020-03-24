# aliases to save precious keypresses

# general purpose
alias ls="exa"
alias n="nnn"
alias pastebin="curl --data-binary @- https://paste.rs/"
alias sc="sudo systemctl"
alias sdm="sudo systemd-mount"
alias sdum="sudo systemd-umount"
alias skrg="sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
alias syu="sudo pacman -Syu"

# git related
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gf="git fetch"
alias go="git checkout"
alias gp="git push"
alias gr="git rebase"
alias gs="git status"

# zig
alias zb="zig build"

# CDDA Compile commands
function {
    local cddamake_common="make -j15 NATIVE=linux64 CCACHE=1 LOCALIZE=0"
    alias cddamake-no-style="$cddamake_common DEBUG_SYMBOLS=1 ASTYLE=0 LINTJSON=0 \
        OTHERS=-fdiagnostics-color"
    alias cddamake="make astyle && cddamake-no-style"
    alias cddamake-tiles-no-style="cddamake-no-style TILES=1 BUILD_PREFIX=\"tiles-\""
    alias cddamake-tiles="make astyle && cddamake-tiles-no-style"
    alias cddamake-tiles-perf="$cddamake_common OTHERS=\"-Ofast -march=native \
        -fdiagnostics-color\" RELEASE=1 LTO=1 TILES=1 ASTYLE=0 LINTJSON=0 \
        USE_XDG_DIR=1 BUILD_PREFIX=perf-"
}
