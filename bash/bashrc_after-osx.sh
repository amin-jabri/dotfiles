#!/bin/bash

#PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
PATH="$(brew --prefix php55)/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/vim/bin:$PATH"
PATH=/usr/local/bin/python:$PATH
export PATH
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

eval `dircolors ~/.dircolors/dircolors-solarized/dircolors.256dark`

#to enable colors for solarized iTerm2
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LC_CTYPE="en_US.UTF-8"
########
