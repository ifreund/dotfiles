_zoxide_precmd() {
    zoxide add
}

[[ -n "${precmd_functions[(r)_zoxide_precmd]}" ]] || {
    precmd_functions+=_zoxide_precmd
}

j() {
    if [ $# -ne 0 ]; then
        _Z_RESULT=$(zoxide query "$@")
        case $_Z_RESULT in
            "query: "*)
                cd "${_Z_RESULT:7}"
                ;;
            *)
                echo "${_Z_RESULT}"
                ;;
        esac
    fi
}

# requires fzf currently
# alias zi="z -i"

# alias za="zoxide add"
# alias zq="zoxide query"
# alias zr="zoxide remove"
