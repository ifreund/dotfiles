#!/bin/sh

# this script must be run from the root of the dotfiles git repository
dotfiles=`pwd`
config_home=${XDG_CONFIG_HOME:-$HOME/.config}

# home dir
# this sets environment variables required to make things use $XDG_CONFIG_HOME
ln -s  $dotfiles/pam_environment ~/.pam_environment

# standard xdg config dir stuff
ln -s $dotfiles/config/aerc/            $config_home
ln -s $dotfiles/config/alacritty/       $config_home
ln -s $dotfiles/config/crawl/           $config_home
ln -s $dotfiles/config/git/             $config_home
ln -s $dotfiles/config/gnupg/           $config_home
ln -s $dotfiles/config/gtk-2.0/         $config_home
ln -s $dotfiles/config/gtk-3.0/         $config_home
ln -s $dotfiles/config/htop/            $config_home
ln -s $dotfiles/config/mimeapps.list    $config_home
ln -s $dotfiles/config/mpv/             $config_home
ln -s $dotfiles/config/nnn/             $config_home
ln -s $dotfiles/config/nvim/            $config_home
ln -s $dotfiles/config/sway/            $config_home
ln -s $dotfiles/config/spicetify/       $config_home
ln -s $dotfiles/config/spotifyd/        $config_home
ln -s $dotfiles/config/waybar/          $config_home
ln -s $dotfiles/config/weechat/         $config_home
ln -s $dotfiles/config/zathura/         $config_home
ln -s $dotfiles/config/zsh/             $config_home
