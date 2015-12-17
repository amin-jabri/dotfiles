#!/bin/bash

# Allow alias expansion in non interactive shell (like in vim :cmd)
shopt -s expand_aliases

# ls aliases
alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -lhF'
alias lla='ls -alhF'
alias la='ls -A'
alias l.='ls -d .*'

# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Misc. aliases
alias vim="vim -u ${HOME}/.vimrc -N -U NONE -X"
alias g='git'
alias tmux='tmux -2 -u'

# IP addresses
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
