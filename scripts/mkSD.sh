export SDCARD=/dev/mmcblk0
if [ ! -z "$1" ]; then
    export SDCARD=$1
fi
export P1START=0
export P1END=60
export P1NAME=boot
export P2START=${P1END}
export P2END=512
export P2NAME=rootfs
sudo umount ${SDCARD}*
sudo parted ${SDCARD} mklabel gpt -s
sudo parted ${SDCARD} mkpart primary fat32 ${P1START}MB ${P1END}MB -s
sudo parted ${SDCARD} mkpart primary ext4 ${P2START}MB ${P2END}MB -s
sudo parted ${SDCARD} name 1 ${P1NAME}
sudo parted ${SDCARD} name 2 ${P2NAME}
sudo mkfs.vfat -n "${P1NAME}" ${SDCARD}p1
sudo mkfs.ext4 -L "${P1NAME}" ${SDCARD}p2