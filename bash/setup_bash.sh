#!/bin/bash

platform=$(uname)

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# we flip the return value for grep because it returns 0 on pattern found;
# also, grep's -q and -s options aren't portable, so we can't use them
file_found=$( ! grep bashrc_after.sh ~/.bashrc > /dev/null 2>&1 ; echo $?)

# add bashrc_after to bashrc if it's not there already
if [[ ! -f ~/.bashrc || ! ${file_found} ]]
then
  echo "source ${script_dir}/bashrc_after.sh" >> ~/.bashrc
  if [[ ${platform} != *Darwin* ]]
  then
    echo "source ${script_dir}/bashrc_after-linux.sh" >> ~/.bashrc
  fi
fi

# Mac OS X will not read .bashrc for terminal shells, but it will read
# .bash_profile
if [[ ${platform} == *Darwin* ]]
then
  # we flip the return value for grep because it returns 0 on pattern found;
  # also, grep's -q and -s options aren't portable, so we can't use them
  file_found=$( ! grep bashrc_after.sh ~/.bash_profile > /dev/null 2>&1 ; echo $?)

  if [[ ! -f ~/.bash_profile || ! ${file_found} ]]
  then
    echo "source ${script_dir}/bashrc_after.sh" >> ~/.bash_profile
    echo "source ${script_dir}/bashrc_after-osx.sh" >> ~/.bash_profile
  fi
else

  file_found=$( ! grep bash_cowsay_logout.sh ~/.bash_logout > /dev/null 2>&1 ; echo $?)
  if [[ ! -f ~/.bash_logout || ! ${file_found} ]]
  then
    echo "source ${script_dir}/bash_cowsay_logout.sh" >> ~/.bash_logout
  fi
fi

# add links to our other files if they are not there already
for file in aliases_bash.sh completion_bash.sh
do
  if [[ ! -a ~/.${file} ]]
  then
    ln -s ${script_dir}/${file} ~/.${file}
  fi
done
