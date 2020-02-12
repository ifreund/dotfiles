# resume the most recently stopped job
function better-ctrl-z () {
    # if the list of stopped jobs is not empty
    if [[ -n $(jobs -sp) ]]; then
        # if the current buffer is not empty
        if [[ $#BUFFER -ne 0 ]]; then
            # save whatever is in the current buffer for later
            zle push-input
        fi
        # put the command to resume the most recently stopped job on the buffer
        BUFFER="fg %$(jobs -sp | tail -n 1 | cut -c 2)"
        # run the command currently on the buffer
        zle accept-line
    fi
}

# add new keymap and bind it to ctrl-Z
zle -N better-ctrl-z
bindkey '^z' better-ctrl-z
