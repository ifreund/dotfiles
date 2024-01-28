provide-module foot %{

define-command foot-terminal -params 1.. -shell-completion %{
    evaluate-commands -save-regs 'a' %{
        set-register a %arg{@}
        evaluate-commands %sh{
            setsid foot sh -c "$kak_quoted_reg_a" < /dev/null > /dev/null 2>&1 &
        }
    }
}

alias global terminal foot-terminal

}
