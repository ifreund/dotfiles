declare-option -hidden range-specs hex_color_code_ranges

add-highlighter shared/hex_color_code ranges hex_color_code_ranges

define-command update_hex_color_code_ranges %{
  set-option window hex_color_code_ranges %val{timestamp}
  evaluate-commands -draft %{
    execute-keys 'gtGbx' # narrow selection to visible lines
    evaluate-commands -draft -verbatim try %{
      execute-keys '1s(\B#|\b0[xX]|\brgb[a]?:)([0-9A-Fa-f]{6})\b<ret>'
      evaluate-commands -itersel %{
        set-option -add window hex_color_code_ranges "%val{selection_desc}|default,rgb:%reg{2}"
      }
    }
  }
}

hook -always global NormalIdle '' update_hex_color_code_ranges
hook -always global InsertIdle '' update_hex_color_code_ranges
hook -always global PromptIdle '' update_hex_color_code_ranges

add-highlighter global/hex_color_code ref hex_color_code
