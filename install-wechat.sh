#!/bin/sh

SUDO=sudo
INSTALLER=apt-get

$SUDO $INSTALLER install -y electronic-wechat
$SUDO ln -sf /usr/share/electronic-wechat/electronic-wechat /usr/local/bin/wechat

