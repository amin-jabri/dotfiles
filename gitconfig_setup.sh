#!/bin/bash

git config --global user.name "Mohamed Amin JABRI"

current_email=$(git config --global --get user.email)

# if current_email is empty, then add an email
if [[ -z "$current_email" ]]
then
    git config --global user.email "amin.jabri@yahoo.fr"
fi

git config --global github.user amin-jabri

git config --global core.editor vim

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.d difftool
git config --global alias.h help
git config --global alias.sub submodule
git config --global alias.unstage "reset HEAD"
git config --global alias.unstash "stash pop"
git config --global alias.dst "diff --staged"
git config --global alias.dc "!git diff | cdiff -s"
git config --global alias.dcs "!git diff --staged | cdiff -s"
git config --global alias.cp "cherry-pick"

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global color.ui true

git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global merge.tool vimdiff

git config --global alias.kd3 "difftool -y -t kdiff3"

# This gives us 'ours', 'base', and 'theirs', instead of just 'ours' and
# 'theirs'. More details:
#   http://psung.blogspot.com/2011/02/reducing-merge-headaches-git-meets.html
git config --global merge.conflictstyle diff3

# Prevents us from having to do merge resolution for things we've already
# resolved before; see http://git-scm.com/blog/2010/03/08/rerere.html
git config --global rerere.enabled true

# With this, "git pull --rebase" is the default form of pull FOR NEWLY CREATED
# BRANCHES; for branches created before this config option is set, pull.rebase
# true handles that
git config --global branch.autosetuprebase always

# "git pull --rebase" is now the default for pull no matter what
git config --global pull.rebase true

# This makes sure that push pushes only the current branch, and pushes it to the
# same branch pull would pull from
git config --global push.default upstream

# This converts CRLF endings to LF endings on Mac & Lin and also keeps them in
# the repo, but for Windows checkouts it converts LF to CRLF (and back to LF on
# commits)
git config --global core.autocrlf input

git config --global alias.meld "difftool --tool=meld --dir-diff -y"

git config --global core.excludesfile ~/.gitignore_global

# Forces the use of SSH instead of HTTPS for any URLs that point to github.
# This means that if a repo uses "https://github/..." for "origin", we will
# automatically use SSH. No more password prompts!
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
