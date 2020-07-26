#!/bin/sh

# this script must be run from the root of the dotfiles git repository
dotfiles=$(pwd)

# this sets environment variables required to make things use $XDG_CONFIG_HOME
ln -s  ${dotfiles}/pam_environment ~/.pam_environment

# create ~/.config and ~/.local if they don't exist
mkdir -p ~/.config
mkdir -p ~/.local

# symlink everything in config
for file in ${dotfiles}/config/*; do
	ln -s ${file} ~/.config/
done

# symlink to ~/.local/bin
ln -s ${dotfiles}/local/bin ~/.local/
