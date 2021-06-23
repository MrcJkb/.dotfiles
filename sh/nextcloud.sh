#!/bin/bash

while ! $(secret-tool lookup Title "Nextcloud Marc" &> /dev/null); do
	echo "wait"
	sleep 1s
done

/usr/bin/nextcloud # --background
