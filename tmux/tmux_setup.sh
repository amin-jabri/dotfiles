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
cat  >> ~/.tmux.conf <<-END-OF-SETTINGS-TMUX

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
if-shell "if [[\`tmux -V | cut -d' ' -f2\` >= 1.9]]; then true; else false; fi" \\
run '~/.tmux/plugins/tpm/tpm'
END-OF-SETTINGS-TMUX
