#!/usr/bin/env bash

# See https://github.com/nextcloud/desktop/issues/2303#issuecomment-708913062
# and https://www.cogitri.dev/posts/03-keepassxc-freedesktop-secret/

# 1 Configure KeePassXC + DB for Secret Service Integration
# -> In DB settings, expose only Secret Service Integration group
# 2 Add this script to autostart

while ! $(secret-tool lookup Title "Nextcloud" &> /dev/null); do
	echo "wait"
	sleep 1s
done
nextcloud # --background
