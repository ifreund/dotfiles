define-command noexpandtab %{
    remove-hooks global noexpandtab
    hook -group noexpandtab global NormalKey <gt> %{ try %{
        execute-keys -draft "<a-x>s^\h+<ret><a-@>"
    }}
    set-option global aligntab true
    remove-hooks global expandtab
    remove-hooks global smarttab
}

define-command expandtab %{
    remove-hooks global expandtab
    hook -group expandtab global InsertChar '\t' %{ execute-keys -draft h@ }
    hook -group expandtab global InsertDelete ' ' %{ try %{
        execute-keys -draft -itersel "<a-h><a-k>^\h+.\z<ret>I<space><esc><lt>"
    }}
    set-option global aligntab false
    remove-hooks global noexpandtab
    remove-hooks global smarttab
}

define-command smarttab %{
    remove-hooks global smarttab
    hook -group smarttab global InsertChar '\t' %{ try %{
        execute-keys -draft <a-h><a-k> "^\h*.\z" <ret>
    } catch %{
        execute-keys -draft h@
    }}
    hook -group smarttab global NormalKey <gt> %{ try %{
        execute-keys -draft "<a-x>s^\h+<ret><a-@>"
    }}
    set-option global aligntab false
    remove-hooks global expandtab
    remove-hooks global noexpandtab
}
