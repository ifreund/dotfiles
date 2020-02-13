#!/bin/sh

# this script must be run from the root of the dotfiles git repository
dotfiles=`pwd`
config_home=${XDG_CONFIG_HOME:-$HOME/.config}

# home dir
# this sets environment variables required to make things use $XDG_CONFIG_HOME
ln -s  $dotfiles/pam_environment ~/.pam_environment

# symlink everything in config
for file in $dotfiles/config/*; do
    ln -s $file $config_home
done

# symlink to ~/.local/bin
ln -s $dotfiles/local/bin ~/.local
