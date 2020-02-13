# change cursor shape depending on vi mode
function zle-keymap-select {
    case ${KEYMAP} in
        vicmd)
            echo -ne '\e[1 q';;

        # this doesn't work currently, but maybe someday
        # https://www.zsh.org/mla/users/2016/msg00188.html
        viopp)
            echo -ne '\e[4 q';;
        
        # main, viins, anything else
        *)
            echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select

# use beam for each new prompt
function fix_cursor {
    echo -ne '\e[5 q'
}

precmd_functions+=(fix_cursor)
