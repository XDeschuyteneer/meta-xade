# Introduction
Yocto project maintain a build tool (bitbake) and a distribution (Poky).<br/>
The goal of this project is to provide OS customisation and SDK (toolchain, etc.) mainly for ARM.<br/>

This github project provides my own meta layer that provides:
* a distribution : XaDeOS
* some images : xadeos and xadeos-debug
* some machines : raspberry-pi-zero-wifi
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
bitbake-layers add-layer ../meta-oe
bitbake-layers add-layer ../meta-python
bitbake-layers add-layer ../meta-raspberrypi
bitbake-layers add-layer ../meta-xade
```

# Build "test" application

This meta-layer contains a test recipe: test.
You can build it to ensure your setup is correct.
We will build it for a raspberry PI Zero WiFi

```
MACHINE="raspberry-pi-zero-wifi" bitbake test
```