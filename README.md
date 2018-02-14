# Introduction
Yocto project maintain a build tool (bitbake) and a distribution (Poky).<br/>
The goal of this project is to provide OS customisation and SDK (toolchain, etc.) mainly for ARM.<br/>

This github project provides my own meta layer that provides:
* a distribution : XaDeOS
* some images : xadeos and xadeos-debug
* some recipes : test

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
MACHINE="imx6ulevk" bitbake test
```

# Build "XaDe" OS

Build the OS for a specific machine

```
MACHINE=imx6ulevk bitbake xadeos-debug
```

Deploy it on a SDCard

```
sudo dd if=${BUILDDIR}/tmp/deploy/images/imx6ulevk/xadeos-debug-imx6ulevk.sdcard of=/dev/mmcblk0
```

You will then be able to login with xade/xade

# Custom OS SDK

## Build the SDK

Inside the docker (and bitbake env setup)

```
MACHINE=imx6ulevk bitbake xadeos-debug -c populate-sdk
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