#!/bin/sh

# Update all packages
sudo xbps-install -Su

# CLI Software I like
sudo xbps-install git zsh vim vim-common vim-colorschemes sakura kitty lynx emacs emacs-common eza rofi dunst picom tmux xdgmenumaker polybar pastel peco jq nerd-fonts python3-setuptools python3-virtualenv virtualenvwrapper eww

# Graphical software I like
sudo xbps-install feh fluxbox gimp inkscape yabar icewm qtile tint2 pekwm jgmenu ImageMagick graphviz xdot python3-graphviz openbox obconf libopenbox obmenu-generator pcmanfm lightdm lxdm lightdm-gtk3-greeter xfdesktop thunar

sudo xbps-remove -yO
sudo xbps-remove -yo
sudo vkpurge rm all
