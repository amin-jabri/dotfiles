#!/bin/bash

# Start ssh-agent
if [ -z "${SSH_AUTH_SOCK}" ] ; then
	eval `ssh-agent -s` >/dev/null 2>&1
	# ssh-add
fi

# kill ssh-agent when exiting
trap 'test -n "${SSH_AUTH_SOCK}" && eval `/usr/bin/ssh-agent -k`' 0
