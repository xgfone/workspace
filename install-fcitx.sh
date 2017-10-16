#!/bin/sh

SUDO=sudo
INSTALLER=apt-get

CWD=$HOME/.workspace

$SUDO $INSTALLER install -y fcitx fcitx-table-wubi fcitx-table-emoji fcitx-skin-sogou fcitx-sogoupinyin-uk
ln -sf $CWD/fcitx/config  $HOME/.config/fcitx/config
ln -sf $CWD/fcitx/profile $HOME/.config/fcitx/profile
fcitx-autostart

