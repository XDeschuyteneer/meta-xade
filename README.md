# Introduction
Yocto project maintain a build tool (bitbake) and a distribution (Poky).<br/>
The goal of this project is to provide OS customisation and SDK (toolchain, etc.) mainly for ARM.<br/>

This github project provides my own meta layer that provides:
* a distribution : XaDeOS
* some images : xadeos and xadeos-debug
* some recipes : test
* some machines : rpi (raspberrypi3, raspberrypi0-wifi, etc.) and imx (imx6ul, imx6ulevk, etc.)

# meta-xade
Poky meta layer building a generic minimal OS

# Setup the git repositories
```
export WORKSPACE="/opt/ewondev/XaDeOS/workspace"
sudo apt install repo
mkdir -p ${WORKSPACE}
cd ${WORKSPACE}
repo init -u git@github.com:XDeschuyteneer/meta-xade.git
repo sync
```

# Setup Poky CROPS (CROssPlatformS)
```
docker run --rm -it -v ${WORKSPACE}:/workdir crops/poky --workdir=/workdir/poky
source oe-init-build-env
```

# Build "test" application

This meta-layer contains a test recipe: test.
You can build it to ensure your setup is correct.

```
bitbake test # by default, build for imx6ulevk
MACHINE="raspberrypi3" bitbake test
```

# Build "XaDe" OS

Build the OS for a specific machine

```
bitbake xadeos-debug
```

Deploy it on a SDCard

```
# for a imx6ulevk
sudo dd if=${BUILDDIR}/tmp/deploy/images/imx6ulevk/xadeos-debug-imx6ulevk.sdcard of=/dev/mmcblk0
# for the raspberrypi3
sudo dd if=${BUILDDIR}/tmp/deploy/images/raspberrypi3/xadeos-debug-raspberrypi3.rpi-sdimg of=/dev/mmcblk0
```

You will then be able to login with xade/xade

# Custom OS SDK

## Build the SDK

Inside the docker (and bitbake env setup)

```
bitbake xadeos-debug -c populate-sdk
```

## Use the SDK

On your host computer.

Now, you can find a big SH file containing the SDK installer.
Copy it on any machine, execute it, follow the instructions.
```
export SDK_INSTALL_DIR=/tmp/xadeos-sdk
mkdir -p ${SDK_INSTALL_DIR}
${WORKSPACE}/poky/build/tmp/deploy/sdk/XaDeOS-glibc-x86_64-xadeos-debug-cortexa7hf-neon-vfpv4-toolchain-2.4.1.sh -d ${SDK_INSTALL_DIR} -y
```

You will then be able to execute the SDK launcher and cross-build any application

```
git clone https://github.com/TheZ3ro/ninvaders.git /tmp/ninvaders
. /tmp/test-sdk/environment-setup-cortexa7hf-neon-vfpv4-poky-linux-gnueabi
cd /tmp/ninvaders
./configure
make -e
file nInvaders # show you an ARM file
# you can copy this file directly on your raspberry pi
```

# Check for CVE

Inside the docker (and bitbake env setup)

You can check CVE for images or individual recipes.

```
bitbake xadeos-debug -c check_cve
bitbake test -c check_cve
```

Bitbake will output warning for every CVE found.
You will get a summary of all CVE (sorted by package) in ${BUILDDIR}/tmp/deploy/cve/ .
If this directory is empty, that means you are not impacted by any CVE.