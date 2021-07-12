#!/bin/sh
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
        -drive file=$HOME/virtual-machines/win10.qcow2,if=virtio \
        -net nic -net user,hostname=windowsvm,smb=$HOME \
        -m 4096 \
        -vga virtio \
        -display gtk,gl=on \
        -monitor stdio \
        -name "Windows" \
        -audiodev pa,id=snd0 \
        -device intel-hda -device hda-output,audiodev=snd0 \
        -rtc base=localtime,clock=host \
        "$@"
# To boot from a gparted live CD, uncomment the below lines and add them as exec parameters
        # -boot d \
        # -cdrom $HOME/Downloads/gparted-live-1.3.0-1-i686.iso \
