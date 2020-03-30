_z_cd() {
    cd "$@" || return "$?"
    if [ -n "$_ZO_ECHO" ]; then
        echo "$PWD"
    fi
}
j() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~ || return "$?"
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD" || return "$?"
        else
            echo "zoxide: \$OLDPWD is not set"
            return 1
        fi
    else
        result="$(zoxide query "$@")" || return "$?"
        case "$result" in
            "query: "*)
                _z_cd "${result#query: }" || return "$?"
                ;;
            *)
                if [ -n "$result" ]; then
                    echo "$result"
                fi
                ;;
        esac
    fi
}
