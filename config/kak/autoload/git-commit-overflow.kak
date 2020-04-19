# highlight lines of git commit messages that are too long

hook -group git-commit-highlight global WinSetOption filetype=git-commit %{
    require-module git-commit-overflow

    add-highlighter window/git-commit-overflow ref git-commit-overflow
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/git-commit-overflow }
}

provide-module git-commit-overflow %{

add-highlighter shared/git-commit-overflow group

# Highlight body at >72 characters
add-highlighter shared/git-commit-overflow/ regex ^[^#\n][^\n]{71}(?<overflow>[^\n]+) overflow:Error

# Highlight summary at >50 characters
add-highlighter shared/git-commit-overflow/ regex \A[^#\n][^\n]{49}(?<overflow>[^\n]+) overflow:Error

# Highlight second line if not a comment or empty
add-highlighter shared/git-commit-overflow/ regex \A[^\n]*\n([^#\n]+) 1:Error

}
