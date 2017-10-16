#!/bin/sh

SUDO=sudo
INSTALLER=apt-get

$SUDO $INSTALLER install -y apps.im.yixin
echo 'deepin-xwalk /lastore/apps/apps.im.yixin/manifest.json' > /tmp/yixin
$SUDO mv -f /tmp/yixin /usr/local/bin/yixin
$SUDO chmod +x /usr/local/bin/yixin

