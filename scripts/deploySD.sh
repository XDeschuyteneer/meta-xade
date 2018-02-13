export SDCARD=/dev/mmcblk0
if [ ! -z "$1" ]; then
    export SDCARD=$1
fi
BOOTFS=/tmp/XaDeOS-mounts/boot
ROOTFS=/tmp/XaDeOS-mounts/rootfs
mkdir ${BOOTFS} -p
mkdir ${ROOTFS} -p
sudo mount ${SDCARD}p1 ${BOOTFS}
sudo mount ${SDCARD}p2 ${ROOTFS}
sudo tar xz ${BUILDDIR}/tmp/deploy/images/raspberrypi3/xadeos-debug-raspberrypi3.tar.xz -C ${ROOTFS}
sudo cp ${BUILDDIR}/tmp/deploy/images/raspberrypi3/{bcm2710-rpi-3-b.dtb,}