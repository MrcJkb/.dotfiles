#!/bin/bash

while ! $(secret-tool lookup Title "Nextcloud Marc" &> /dev/null); do
	echo "Nexcloud secret not available. Trying again in 1 min..." | systemd-cat
	sleep 60s
done

/usr/bin/nextcloud --background
