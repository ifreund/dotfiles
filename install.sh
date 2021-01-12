#!/bin/sh

# this script must be run from the root of the dotfiles git repository
dotfiles=$(pwd)

# this sets environment variables required to make things use $XDG_CONFIG_HOME
ln -s  ${dotfiles}/zshenv ~/.zshenv

# create ~/.config and ~/.local if they don't exist
mkdir -p ~/.config
mkdir -p ~/.local/bin

# symlink everything in config and local/bin
for file in ${dotfiles}/config/*; do
	ln -s ${file} ~/.config/
done
for file in ${dotfiles}/local/bin/*; do
	ln -s ${file} ~/.local/bin/
done
