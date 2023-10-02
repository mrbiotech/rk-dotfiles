#!/bin/sh

# Update all packages
sudo xbps-install -Su

# CLI Software I like
sudo xbps-install zsh vim vim-common vim-colorschemes kitty lynx emacs emacs-common nmap exa rofi dunst picom tmux xdgmenumaker polybar pastel

# Graphical software I like
sudo xbps-install feh aseprite yabar tint2 jgmenu ImageMagick graphviz xdot python3-graphviz pcmanfm lightdm lxdm lightdm-gtk3-greeter xfdesktop

sudo xbps-remove -yO
sudo xbps-remove -yo
sudo vkpurge rm all
