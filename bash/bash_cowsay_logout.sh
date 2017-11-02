#!/bin/bash

/bin/chmod 700 ~
/usr/bin/clear

COWSAY=$(which cowsay 2>/dev/null)
FORTUNE=$(which fortune 2>/dev/null)

if [[ "${COWSAY}" != "" ]]
then
  if [[ "${FORTUNE}" != "" ]]
  then
    ${COWSAY} -f www $(${FORTUNE} -s)
  else
    ${COWSAY} "Au revoir ${USER}!"
  fi
fi
