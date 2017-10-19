#!/bin/sh

CWD=$HOME/.workspace
SUDO=sudo
INSTALLER=apt-get

$SUDO $INSTALLER install -y python-pip python3-pip
$SUDO pip install pylint nose pep8 jedi

ln -s $CWD/pylintrc $HOME/.pylintrc
ln -s $CWD/pep8 $HOME/.config/pep8

