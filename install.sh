#!/bin/bash

# this script must be run from the root of the dotfiles git repository
dotfiles=`pwd`

# standard xdg config dir stuff
ln -s $dotfiles/config/alacritty/ ~/.config/
ln -s $dotfiles/config/fish/      ~/.config/
ln -s $dotfiles/config/gtk-3.0/   ~/.config/
ln -s $dotfiles/config/mpv/       ~/.config/
ln -s $dotfiles/config/nnn/       ~/.config/
ln -s $dotfiles/config/nvim/      ~/.config/
ln -s $dotfiles/config/sway/      ~/.config/
ln -s $dotfiles/config/spotifyd/  ~/.config/
ln -s $dotfiles/config/waybar/    ~/.config/
ln -s $dotfiles/config/zathura/   ~/.config/
ln -s $dotfiles/config/zsh/       ~/.config/

# spicetify is a little different
ln -s $dotfiles/config/spicetify/Themes/ ~/.config/spicetify/

# home dir stuff
# need the -T for some of these which are otherwise ambiguous
ln -sT $dotfiles/crawl           ~/.crawl
ln -s  $dotfiles/gitconfig       ~/.gitconfig
ln -sT $dotfiles/gnupg           ~/.gnupg
ln -s  $dotfiles/gtkrc-2.0       ~/.gtkrc-2.0
ln -s  $dotfiles/pam_environment ~/.pam_environment
ln -sT $dotfiles/weechat/        ~/.weechat
