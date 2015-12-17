#!/bin/bash

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# change beer mug emoji for finished build
export HOMEBREW_INSTALL_BADGE="☕️"

# brew-cask symlink into /Applications instead of ~/Applications
# override on the command line when installing:
# brew cask install --appdir="~/Applications" google-chrome
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# set our PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/bin:$PATH"
PATH="$(brew --prefix php55)/bin:$PATH"
export PATH

# Enable colors for solarized iTerm2
eval `dircolors ~/.dircolors/dircolors-solarized/dircolors.256dark`
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LC_CTYPE="en_US.UTF-8"
