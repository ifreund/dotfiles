# https://protesilaos.com/emacs/modus-themes-colors

evaluate-commands %sh{

bg_main='rgb:ffffff'
bg_dim='rgb:f2f2f2'
fg_main='rgb:000000'
fg_dim='rgb:595959'
fg_alt='rgb:193668'
bg_active='rgb:c4c4c4'
bg_inactive='rgb:e0e0e0'
border='rgb:9f9f9f'
red='rgb:a60000'
red_warmer='rgb:972500'
red_cooler='rgb:a0132f'
red_faint='rgb:7f0000'
red_intense='rgb:d00000'
green='rgb:006800'
green_warmer='rgb:316500'
green_cooler='rgb:00663f'
green_faint='rgb:2a5045'
green_intense='rgb:008900'
yellow='rgb:6f5500'
yellow_warmer='rgb:884900'
yellow_cooler='rgb:7a4f2f'
yellow_faint='rgb:624416'
yellow_intense='rgb:808000'
blue='rgb:0031a9'
blue_warmer='rgb:3548cf'
blue_cooler='rgb:0000b0'
blue_faint='rgb:003497'
blue_intense='rgb:0000ff'
magenta='rgb:721045'
magenta_warmer='rgb:8f0075'
magenta_cooler='rgb:531ab6'
magenta_faint='rgb:7c318f'
magenta_intense='rgb:dd22dd'
cyan='rgb:005e8b'
cyan_warmer='rgb:3f578f'
cyan_cooler='rgb:005f5f'
cyan_faint='rgb:005077'
cyan_intense='rgb:008899'
rust='rgb:8a290f'
gold='rgb:80601f'
olive='rgb:56692d'
slate='rgb:2f3f83'
indigo='rgb:4a3a8a'
maroon='rgb:731c52'
pink='rgb:7b435c'
bg_red_intense='rgb:ff8f88'
bg_green_intense='rgb:8adf80'
bg_yellow_intense='rgb:f3d000'
bg_blue_intense='rgb:bfc9ff'
bg_magenta_intense='rgb:dfa0f0'
bg_cyan_intense='rgb:a4d5f9'
bg_red_subtle='rgb:ffcfbf'
bg_green_subtle='rgb:b3fabf'
bg_yellow_subtle='rgb:fff576'
bg_blue_subtle='rgb:ccdfff'
bg_magenta_subtle='rgb:ffddff'
bg_cyan_subtle='rgb:bfefff'
bg_red_nuanced='rgb:ffe8e8'
bg_green_nuanced='rgb:e0f6e0'
bg_yellow_nuanced='rgb:f8f0d0'
bg_blue_nuanced='rgb:ecedff'
bg_magenta_nuanced='rgb:f8e6f5'
bg_cyan_nuanced='rgb:e0f2fa'
bg_clay='rgb:f1c8b5'
fg_clay='rgb:63192a'
bg_ochre='rgb:f0e3c0'
fg_ochre='rgb:573a30'
bg_lavender='rgb:dfcdfa'
fg_lavender='rgb:443379'
bg_sage='rgb:c0e7d4'
fg_sage='rgb:124b41'
bg_graph_red_0='rgb:ef7969'
bg_graph_red_1='rgb:ffaab4'
bg_graph_green_0='rgb:45c050'
bg_graph_green_1='rgb:75ef30'
bg_graph_yellow_0='rgb:ffcf00'
bg_graph_yellow_1='rgb:f9ff00'
bg_graph_blue_0='rgb:7f90ff'
bg_graph_blue_1='rgb:a6c0ff'
bg_graph_magenta_0='rgb:e07fff'
bg_graph_magenta_1='rgb:fad0ff'
bg_graph_cyan_0='rgb:70d3f0'
bg_graph_cyan_1='rgb:afefff'
bg_completion='rgb:c0deff'
bg_hover='rgb:b2e4dc'
bg_hover_secondary='rgb:f5d0a0'
bg_hl_line='rgb:dae5ec'
bg_region='rgb:bdbdbd'
fg_region='rgb:000000'
bg_mode_line_active='rgb:c8c8c8'
fg_mode_line_active='rgb:000000'
border_mode_line_active='rgb:5a5a5a'
bg_mode_line_inactive='rgb:e6e6e6'
fg_mode_line_inactive='rgb:585858'
border_mode_line_inactive='rgb:a3a3a3'
modeline_err='rgb:7f0000'
modeline_warning='rgb:5f0070'
modeline_info='rgb:002580'
bg_tab_bar='rgb:dfdfdf'
bg_tab_current='rgb:ffffff'
bg_tab_other='rgb:c2c2c2'
bg_added='rgb:c1f2d1'
bg_added_faint='rgb:d8f8e1'
bg_added_refine='rgb:aee5be'
bg_added_fringe='rgb:6cc06c'
fg_added='rgb:005000'
fg_added_intense='rgb:006700'
bg_changed='rgb:ffdfa9'
bg_changed_faint='rgb:ffefbf'
bg_changed_refine='rgb:fac090'
bg_changed_fringe='rgb:d7c20a'
fg_changed='rgb:553d00'
fg_changed_intense='rgb:655000'
bg_removed='rgb:ffd8d5'
bg_removed_faint='rgb:ffe9e9'
bg_removed_refine='rgb:f3b5af'
bg_removed_fringe='rgb:d84a4f'
fg_removed='rgb:8f1313'
fg_removed_intense='rgb:aa2222'
bg_diff_context='rgb:f3f3f3'
bg_paren_match='rgb:5fcfff'
bg_paren_expression='rgb:efd3f5'

echo "
# syntax
face global value              ${blue_cooler}
face global type               ${cyan_cooler}
face global variable           ${cyan}
face global module             default
face global function           ${magenta}
face global string             ${blue_warmer}
face global keyword            ${magenta_cooler}
face global operator           default
face global attribute          ${cyan}
face global comment            ${fg_dim}
face global documentation      ${green_faint}
face global meta               ${red_cooler}
face global builtin            ${magenta_warmer}

# markup
face global title              ${cyan_cooler}+b
face global header             ${cyan_cooler}
face global mono               default
face global block              default
face global link               ${blue_warmer}
face global bullet             default
face global list               default

# builtin
face global Default            ${fg_main},${bg_main}
face global PrimarySelection   ${fg_main},${bg_region}+fg
face global SecondarySelection ${fg_dim},${bg_region}+fg
face global PrimaryCursor      ${bg_main},${fg_main}+fg
face global SecondaryCursor    ${bg_main},${fg_dim}+fg
face global PrimaryCursorEol   ${bg_main},${fg_dim}+fg
face global SecondaryCursorEol ${bg_main},${fg_dim}+fg
face global LineNumbers        ${fg_dim},${bg_dim}
face global LineNumberCursor   ${fg_main},${bg_active}
face global LineNumbersWrapped ${bg_dim},${bg_dim}
face global MenuForeground     ${fg_main},${bg_active}
face global MenuBackground     ${fg_main},${bg_main}
face global MenuInfo           ${fg_dim}
face global Information        ${cyan_cooler}
face global Error              ${red},default+b
face global DiagnosticError    ${red}
face global DiagnosticWarning  ${yellow_warmer}
face global StatusLine         ${fg_main},${bg_active}
face global StatusLineMode     default
face global StatusLineInfo     default
face global StatusLineValue    default
face global StatusCursor       ${bg_main},${fg_main}
face global Prompt             ${fg_main}+b
face global MatchingChar       ${bg_dim},${fg_dim}+fg
face global BufferPadding      ${fg_main},${bg_main}
face global Whitespace         ${fg_dim}+f
"
}
