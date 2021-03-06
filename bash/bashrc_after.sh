#!/bin/bash

if [[ -f ~/.completion_bash.sh ]]; then
    source ~/.completion_bash.sh
fi

if [[ -f ~/.aliases_bash.sh ]]; then
    source ~/.aliases_bash.sh
fi

# This is all for the bash prompt; it shows the current git branch
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e $gitver
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                # we color the branch name green if there are no unstanged
                # changes, and red if there are some
                color=""
                if git diff --quiet 2>/dev/null >&2
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

branch_display ()
{
  if [[ $(parse_git_branch) ]]
  then
    echo -ne "$(branch_color)$(parse_git_branch)${c_sgr0} "
    # echo -ne "$(branch_color)[$(parse_git_branch)${c_sgr0}]"
  else
    echo ""
  fi
}

PS1='[$(branch_display)\u@\h:\[${c_red}\]\W\[${c_sgr0}\]]\$ '
# export PS1="[\u@\h:\W]\$ "

# We want bash to be case-insensitive for tab completion
bind 'set completion-ignore-case on'

export EDITOR="vim -u $HOME/.vimrc -N -U NONE -X"

export LANG=en_US.UTF-8

#tmux wants term to be set to screen or screen-256color
export TERM=screen-256color

# No duplicates in command history
export HISTCONTROL=ignoreboth:erasedups

# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

# Less colors for man pages
export PAGER="less --squeeze-blank-lines" # Don't set  it in LESS as it
                                          # interferes with git lg

# Add home directory's bin to path
export PATH=$PATH:$HOME/bin
