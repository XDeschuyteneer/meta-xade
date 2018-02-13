SUMMARY = "XaDe OS debug package"

PR = "r1"

inherit packagegroup

RDEPENDS_${PN} = "dropbear"
RDEPENDS_${PN} += "bash"
