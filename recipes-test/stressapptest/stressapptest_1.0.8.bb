SUMMARY = "A tool to load and stress a computer system"
HOMEPAGE = "https://github.com/stressapptest/stressapptest"
LICENSE = "Apache-2.0"

inherit autotools
SRC_URI = "git://github.com/stressapptest/stressapptest.git;tag=v${PV}"
S="${WORKDIR}/git"
LIC_FILES_CHKSUM = "file://${S}/src/main.cc;beginline=0;endline=14;md5=98f30e2a0592e3c41a0ba66265f71ade"