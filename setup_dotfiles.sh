#!/bin/bash

# get the dir of the current script
script_directory=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.vimrc ]]
then
  ln -f -s $script_directory/vim/vimrc.vim ~/.vimrc
fi

if [[ ! -a ~/.gitignore_global ]]
then
  ln -f -s $script_directory/misc/gitignore_global ~/.gitignore_global
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

source $script_directory/bash/setup_bash.sh
source $script_directory/gitconfig_setup.sh
source $script_directory/tmux/tmux_setup.sh
