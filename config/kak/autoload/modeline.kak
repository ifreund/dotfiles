face global _ml_buffer_sep bright-cyan
face global _ml_buffer bright-black,bright-cyan

face global _ml_coords_sep bright-red,bright-cyan
face global _ml_coords bright-black,bright-red

face global _ml_context_sep bright-cyan,bright-red
face global _ml_context bright-black,bright-cyan

face global _ml_client_sep blue,bright-cyan
face global _ml_client bright-black,blue

face global StatusLineInfo blue

set global modelinefmt '{{mode_info}} {_ml_buffer_sep}{_ml_buffer} %val{bufname} {_ml_coords_sep}{_ml_coords} %val{cursor_line}:%val{cursor_char_column} {_ml_context_sep}{_ml_context}{{context_info}}{_ml_client_sep}{_ml_client} %val{client}-%val{session} '
