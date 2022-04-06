#!/usr/bin/env bash

# See https://github.com/nextcloud/desktop/issues/2303#issuecomment-708913062
# and https://www.cogitri.dev/posts/03-keepassxc-freedesktop-secret/

# 1 Configure KeePassXC + DB for Secret Service Integration
# 2 Add this script to autostart

while ! $(secret-tool lookup Title "TheGoodCloud (NextCloud)" &> /dev/null); do
	echo "wait"
	sleep 1s
done
nextcloud # --background
