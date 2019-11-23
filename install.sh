#!/bin/bash

# standard config dir stuff
ln -s ~/git-repos/dotfiles/config/alacritty/ ~/.config/
ln -s ~/git-repos/dotfiles/config/Dharkael/  ~/.config/
ln -s ~/git-repos/dotfiles/config/i3/        ~/.config/
ln -s ~/git-repos/dotfiles/config/i3blocks/  ~/.config/
ln -s ~/git-repos/dotfiles/config/nnn/       ~/.config/
ln -s ~/git-repos/dotfiles/config/nvim/      ~/.config/
ln -s ~/git-repos/dotfiles/config/picom/     ~/.config/
ln -s ~/git-repos/dotfiles/config/rofi/      ~/.config/
ln -s ~/git-repos/dotfiles/config/zathura/   ~/.config/

# spicetify is a little different
ln -s ~/git-repos/dotfiles/config/spicetify/Themes/ ~/.config/spicetify/

# home dir stuff
ln -s ~/git-repos/dotfiles/Xresources        ~/.Xresources
ln -s ~/git-repos/dotfiles/Xresources_colors ~/.Xresources_colors

ln -s ~/git-repos/dotfiles/xprofile ~/.xprofile
ln -s ~/git-repos/dotfiles/zprofile ~/.zprofile

ln -s ~/git-repos/dotfiles/zshrc   ~/.zshrc
ln -s ~/git-repos/dotfiles/xinitrc ~/.xinitrc
