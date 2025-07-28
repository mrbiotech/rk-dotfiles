#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

source ~/.env

##### export WINHOME=/mnt/c/Users/richk
##### export WINDLS=/mnt/d/SeagateHDD-Downloads
##### export WINDOCS=/mnt/d/richk/Documents
##### export ORG=/mnt/c/Users/richk/iCloudDrive/Info/org
##### export WIKI=/mnt/c/Users/richk/iCloudDrive/Info/vimwiki

# For Python virtualenvs:
##### export WORKON_HOME=$HOME/.virtualenvs
##### export PROJECT_HOME=$HOME/Projects
##### export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
##### export VIRTUALENVWRAPPER_VIRTUALENV=/usr/sbin/virtualenv
##### source /usr/sbin/virtualenvwrapper.sh

# For Go Lang (here in WSL2):
##### export GOROOT=/usr/local/go
##### export GOPATH=$HOME/go
##### export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PASTEL_COLOR_MODE=24bit

source ~/.aliases.sh
. "$HOME/.cargo/env"

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
