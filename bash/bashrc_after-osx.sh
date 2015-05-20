#!/bin/bash

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# homebrew bash completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# set our PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:$PATH"
PATH="/usr/local/opt/vim/bin:$PATH"
PATH="/usr/local/bin/python:$PATH"
PATH="$(brew --prefix php55)/bin:$PATH"
export PATH

# Enable colors for solarized iTerm2
eval `dircolors ~/.dircolors/dircolors-solarized/dircolors.256dark`
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LC_CTYPE="en_US.UTF-8"
########
