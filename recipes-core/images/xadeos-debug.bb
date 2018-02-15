require xadeos.bb
IMAGE_INSTALL += "packagegroup-xadeos-debug-tools"
IMAGE_INSTALL += "packagegroup-xadeos-test-tools"
IMAGE_FEATURES += "dev-pkgs"
inherit extrausers
EXTRA_USERS_PARAMS = "useradd -P xade xade;"