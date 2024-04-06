hook global WinSetOption filetype=janet %{
    set-option window formatcmd 'janet-fmt'
    set-option window indentwidth 2
    expandtab
}
