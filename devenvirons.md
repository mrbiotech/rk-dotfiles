#!/bin/sh

# Check for underlying development frameworks and install appropriate paths and aliases if they exist.

if [ -s `which python3` ]; then
   echo "Found python3!!"
elif

fi


# Starship prompt

# Python3 installed? Local file structure writable?
# 1) Install pip
# 2) Install virtualenv virtualenvwrapper
# 3) Append paths and ENVars in zshenv and zprofile
# | OS       | Item                             | Location                    |
# | -------- | -------------------------------- | --------------------------- |
# | Win/WSL2 | WORKON_HOME                      | $HOME/.virtualenvs          |
# | Win/WSL2 | PROJECT_HOME                     | $HOME/Projects              |
# | Win/WSL2 | VIRTUALENVWRAPPER_PYTHON         | /usr/bin/python3            |
# | Win/WSL2 | VIRTUALENVWRAPPER_VIRTUALENV     | $HOME/.local/bin/virtualenv |
# | Void     | WORKON_HOME                      | $HOME/.virtualenvs          |
# | Void     | PROJECT_HOME                     | $HOME/Projects              |
# | Void     | VIRTUALENVWRAPPER_PYTHON         | /usr/bin/python3            |
# | Void     | VIRTUALENVWRAPPER_VIRTUALENV     | $HOME/.local/bin/virtualenv |
# | Garuda   | WORKON_HOME                      | $HOME/.virtualenvs          |
# | Garuda   | PROJECT_HOME                     | $HOME/Projects              |
# | Garuda   | VIRTUALENVWRAPPER_PYTHON         | /usr/bin/python3            |
# | Garuda   | VIRTUALENVWRAPPER_VIRTUALENV     | $HOME/.local/bin/virtualenv |
# |          |                                  |                             |

# Node and NVM
# | OS       | Item                             | Location                    |
# | -------- | -------------------------------- | --------------------------- |
# | Win/WSL2 | NVM_DIR                          | $HOME/.nvm                  |
# |          |                                  |                             |


# Go
# | OS       | Item                             | Location                      |
# | -------- | -------------------------------- | ---------------------------   |
# | Win/WSL2 | GOROOT                           | /usr/local/go                 |
# | Win/WSL2 | GOPATH                           | $HOME/go                      |
# | Win/WSL2 | PATH                             | $GOPATH/bin:$GOROOT/bin/$PATH |
# |          |                                  |                               |


# Rust & Cargo
# ZshEnv
# . "$HOME/.cargo/env"
