#!/bin/sh
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
        # -boot d \
        # -cdrom $HOME/Downloads/gparted-live-1.3.0-1-i686.iso \
        -drive file=$HOME/virtual-machines/win10.qcow2,if=virtio \
        -net nic -net user,hostname=windowsvm,smb=$HOME \
        -m 8192 \
        -vga virtio \
        -display gtk,gl=on \
        -monitor stdio \
        -name "Windows" \
        -audiodev pa,id=snd0 \
        -device intel-hda -device hda-output,audiodev=snd0 \
        -rtc base=localtime,clock=host \
        "$@"
