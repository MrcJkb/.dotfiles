#!/bin/sh
SPICE_PORT=5930
qemu-system-x86_64 -enable-kvm \
        -cpu host \
        -drive file=${HOME}/virtual-machines/win10.qcow2,if=virtio \
        -net nic -net user,hostname=windowsvm,smb=${HOME} \
        -m 4G \
        -vga virtio \
        -display gtk,gl=on \
        -monitor stdio \
        -name "Windows" \
        -audiodev pa,id=snd0 \
        -device intel-hda -device hda-output,audiodev=snd0 \
        -rtc base=localtime,clock=host \
        -smp cores=2,threads=4 \
        "$@"
        # -bios /usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
        # -cdrom ${HOME}/virtual-machines/virtio-win.iso \
        # TODO: Add SPICE support, see https://wiki.archlinux.org/title/QEMU#Enabling_SPICE_support_on_the_host
        # -spice port=${SPICE_PORT},disable-ticketing=on \
        # -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
        # -chardev spicevmc,id=spicechannel0,name=vdagent
# To boot from a gparted live CD, uncomment the below lines and add them as exec parameters
        # -boot d \
        # -cdrom $HOME/Downloads/gparted-live-1.3.0-1-i686.iso \

# exec spicy --title Windows 127.0.0.1 -p ${SPICE_PORT}
