#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='$EDITOR'
export PAGER='less'
export BROWSER='chromium'
export TERMINAL='kitty'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/.local/{bin,sbin}
  $HOME/.config/emacs/bin
  $path
)

export PATH="$HOME/.config/polybar/scripts:$PATH"

if command -v xmodmap >/dev/null 2>&1; then
    xmodmap ~/.Xmodmap
fi

source ~/.env

if [[ -f "$HOME/.aliases.sh" ]]; then
    source "$HOME/.aliases.sh"
fi
