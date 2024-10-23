define-command noexpandtab %{
    remove-hooks global noexpandtab
    hook -group noexpandtab global NormalKey <gt> %{ try %{
        execute-keys -draft "xs^\h+<ret><a-@>"
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
        execute-keys -draft "xs^\h+<ret><a-@>"
    }}
    set-option global aligntab false
    remove-hooks global expandtab
    remove-hooks global noexpandtab
}

# copied from upstream kakoune and modified to
# 1. disable autowrap
# 2. customize the color of the max column highlighting to solrized base02
# 3. run the expandtab/noexpandtab commands as needed
define-command my-editorconfig-load -params ..1 -docstring "editorconfig-load [file]: set formatting behavior according to editorconfig" %{
    evaluate-commands %sh{
        command -v editorconfig >/dev/null 2>&1 || { echo "fail editorconfig could not be found"; exit 1; }

        file="${1:-$kak_buffile}"
        case $file in
            /*) # $kak_buffile is a full path that starts with a '/'
                printf %s\\n "remove-hooks buffer editorconfig-hooks"
                editorconfig "$file" | awk -v file="$file" -F= -- '
                    $1 == "indent_style"             { indent_style = $2 }
                    $1 == "indent_size"              { indent_size = $2 == "tab" ? 4 : $2 }
                    $1 == "tab_width"                { tab_width = $2 }
                    $1 == "end_of_line"              { end_of_line = $2 }
                    $1 == "charset"                  { charset = $2 }
                    $1 == "trim_trailing_whitespace" { trim_trailing_whitespace = $2 }
                    $1 == "max_line_length"          { max_line_length = $2 }

                    END {
                        if (indent_size || tab_width) {
                            print "set-option buffer tabstop " (tab_width ? tab_width : indent_size)
                        }
                        if (indent_style == "tab") {
                            print "set-option buffer indentwidth 0"
                            print "noexpandtab"
                        }
                        if (indent_style == "space") {
                            print "set-option buffer indentwidth " indent_size
                            print "expandtab"
                        }
                        if (end_of_line == "lf" || end_of_line == "crlf") {
                            print "set-option buffer eolformat " end_of_line
                        }
                        if (charset == "utf-8-bom") {
                            print "set-option buffer BOM utf8"
                        }
                        if (trim_trailing_whitespace == "true") {
                            print "hook buffer BufWritePre \"" file "\" -group editorconfig-hooks %{ try %{ execute-keys -draft %{%s\\h+$|\\n+\\z<ret>d} } }"
                        }
                        if (max_line_length && max_line_length != "off") {
                            print "add-highlighter window/ column %sh{ echo $((" max_line_length "+1)) } default,rgb:073642"
                        }
                    }
                ' ;;
        esac
    }
}
