#!/bin/bash

# standard config dir stuff
ln -s ~/git-repos/dotfiles/config/alacritty/ ~/.config/
ln -s ~/git-repos/dotfiles/config/mpv/       ~/.config/
ln -s ~/git-repos/dotfiles/config/nnn/       ~/.config/
ln -s ~/git-repos/dotfiles/config/nvim/      ~/.config/
ln -s ~/git-repos/dotfiles/config/rofi/      ~/.config/
ln -s ~/git-repos/dotfiles/config/sway/      ~/.config/
ln -s ~/git-repos/dotfiles/config/waybar/    ~/.config/
ln -s ~/git-repos/dotfiles/config/zathura/   ~/.config/

# spicetify is a little different
ln -s ~/git-repos/dotfiles/config/spicetify/Themes/ ~/.config/spicetify/

# home dir stuff
ln -s ~/git-repos/dotfiles/gitconfig ~/.gitconfig
# need the -T since this is otherwise ambiguous
ln -sT ~/git-repos/dotfiles/gnupg    ~/.gnupg
ln -sT ~/git-repos/dotfiles/weechat/ ~/.weechat
ln -s ~/git-repos/dotfiles/zprofile ~/.zprofile
ln -s ~/git-repos/dotfiles/zshrc    ~/.zshrc
