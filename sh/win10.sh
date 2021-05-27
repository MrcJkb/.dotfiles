#!/bin/sh
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
        -drive file=$HOME/virtual-machines/win10.img,if=virtio \
        -net nic -net user,hostname=windowsvm,smb=$HOME \
        -m 8G \
        -vga virtio \
        -display gtk,gl=on \
        -monitor stdio \
        -name "Windows" \
        -audiodev pa,id=snd0 \
        -device intel-hda -device hda-output,audiodev=snd0 \
        -rtc base=localtime,clock=host \
        "$@"
