if not set -q ifreund_fish_colors_set
    echo "setting fish colors"
    set -U ifreund_fish_colors_set

    set -U fish_color_autosuggestion brgreen
    set -U fish_color_cancel red
    set -U fish_color_command green
    set -U fish_color_comment brgreen
    set -U fish_color_cwd blue
    set -U fish_color_cwd_root red
    set -U fish_color_end brblue
    set -U fish_color_error red
    set -U fish_color_escape brred
    set -U fish_color_history_current --bold
    set -U fish_color_host brblue
    set -U fish_color_host_remote yellow
    set -U fish_color_match brblue
    set -U fish_color_normal brblue
    set -U fish_color_operator yellow
    set -U fish_color_param brblue
    set -U fish_color_quote cyan
    set -U fish_color_redirection green
    set -U fish_color_search_match --background=black
    set -U fish_color_selection -r
    set -U fish_color_status red
    set -U fish_color_user brblue
    set -U fish_color_valid_path brblue

    set -U fish_pager_color_completion bryellow
    set -U fish_pager_color_description cyan
    set -U fish_pager_color_prefix brcyan --bold
    set -U fish_pager_color_progress -r
end
