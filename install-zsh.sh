#!/bin/sh

SUDO=sudo
INSTALLER=apt-get
CWD=$HOME/.workspace

$SUDO $INSTALLER install -y zsh

if [ -f $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc_bak
fi
ln -s $CWD/zshrc $HOME/.zshrc
