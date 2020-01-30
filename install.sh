#!/bin/sh

# this script must be run from the root of the dotfiles git repository
dotfiles=`pwd`
config_home=${XDG_CONFIG_HOME:-$HOME/.config}

# standard xdg config dir stuff
ln -s $dotfiles/config/alacritty/       $config_home
ln -s $dotfiles/config/fish/            $config_home
ln -s $dotfiles/config/git/             $config_home
ln -s $dotfiles/config/gtk-3.0/         $config_home
ln -s $dotfiles/config/htop/            $config_home
ln -s $dotfiles/config/mimeapps.list/   $config_home
ln -s $dotfiles/config/mpv/             $config_home
ln -s $dotfiles/config/nnn/             $config_home
ln -s $dotfiles/config/nvim/            $config_home
ln -s $dotfiles/config/sway/            $config_home
ln -s $dotfiles/config/spotifyd/        $config_home
ln -s $dotfiles/config/waybar/          $config_home
ln -s $dotfiles/config/zathura/         $config_home
ln -s $dotfiles/config/zsh/             $config_home

# spicetify is a little different
ln -s $dotfiles/config/spicetify/Themes/ ~/.config/spicetify/

# home dir stuff
# need the -T for some of these which are otherwise ambiguous
ln -sT $dotfiles/crawl           ~/.crawl
ln -sT $dotfiles/gnupg           ~/.gnupg
ln -s  $dotfiles/gtkrc-2.0       ~/.gtkrc-2.0
ln -s  $dotfiles/pam_environment ~/.pam_environment
ln -sT $dotfiles/weechat/        ~/.weechat
