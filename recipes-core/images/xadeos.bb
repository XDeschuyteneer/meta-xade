SUMMARY = "XaDe OS"

IMAGE_INSTALL += "kernel-modules"
IMAGE_INSTALL += "packagegroup-core-boot"
IMAGE_INSTALL += "${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

IMAGE_FSTYPES = "tar.bz2 ext4 tar.xz"
IMAGE_FSTYPES_append_mx6 = " sdcard"
IMAGE_FSTYPES_append_rpi = " rpi-sdimg"
IMAGE_ROOTFS_SIZE = "8192"
