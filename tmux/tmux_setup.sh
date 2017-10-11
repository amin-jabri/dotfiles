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

cat  >> ~/.tmux.conf <<-END-OF-SETTINGS-TMUX

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
#requires tmux version 1.9 or higher
if-shell "[[ -f ~/.tmux/plugins/tpm/tpm ]]" \
'run-shell "~/.tmux/plugins/tpm/tpm"'
END-OF-SETTINGS-TMUX
