#!/bin/sh

SUDO=sudo
INSTALLER=apt-get

$SUDO $INSTALLER install -y apps.com.youdao.note
echo 'deepin-xwalk /lastore/apps/apps.com.youdao.note/manifest.json' >/tmp/youdao-note
$SUDO mv -f /tmp/youdao-note /usr/local/bin/youdao-note
$SUDO chmod +x /usr/local/bin/youdao-note

