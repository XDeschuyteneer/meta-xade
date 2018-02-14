export SDCARD=/dev/mmcblk0
export MACHINE=${MACHINE}
export BUILDDIR=${BUILDDIR}
export FILES=""

while getopts "s:m:b:f:" option ; do
    case ${option} in
    s)
        export SDCARD=${OPTARG}  
    ;;
    m)
        export MACHINE=${OPTARG}
    ;;
    b)
        export BUILDDIR=${OPTARG}
    ;;
    f)
        export FILES=${OPTARG}
    ;;
    esac
done

BOOTFS=/tmp/XaDeOS-mounts/boot
ROOTFS=/tmp/XaDeOS-mounts/rootfs
mkdir ${BOOTFS} -p
mkdir ${ROOTFS} -p
sudo mount ${SDCARD}p1 ${BOOTFS}
sudo mount ${SDCARD}p2 ${ROOTFS}
sudo tar xf ${BUILDDIR}/tmp/deploy/images/${MACHINE}/xadeos-debug-${MACHINE}.tar.xz -C ${ROOTFS}
sudo cp ${BUILDDIR}/tmp/deploy/images/${MACHINE}/zImage ${BOOTFS}/
sudo cp ${BUILDDIR}/tmp/deploy/images/${MACHINE}/{${FILES}} ${BOOTFS}/
sudo umount ${ROOTFS}
sudo umount ${BOOTFS}