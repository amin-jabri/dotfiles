#!/bin/bash

cp -f $HOME/dotfiles/tmux/tmux-main.conf ~/.tmux.conf

platform=$(uname)

# we need to configure tmux differently depending on OS
if [[ $platform == *Darwin* ]]
then
  cat $HOME/dotfiles/tmux/tmux-osx.conf >> ~/.tmux.conf
else
  cat $HOME/dotfiles/tmux/tmux-linux.conf >> ~/.tmux.conf
fi

# add tmux plugin manager config last
cat $HOME/dotfiles/tmux/tmux_plugin_manager.conf >> ~/.tmux.conf
