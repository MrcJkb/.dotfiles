#!/bin/sh
URL=$1
USER=$2
printf "url=$URL\nusername=$USER" | git-credential-keepassxc get | sed -n 's/^password=//p'
