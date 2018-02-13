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
TEMPLATECONF=meta-xade/conf source oe-init-build-env
```

# Build "test" application

This meta-layer contains a test recipe: test.
You can build it to ensure your setup is correct.

```
MACHINE="raspberrypi0-wifi" bitbake test
MACHINE="raspberrypi3" bitbake test
```