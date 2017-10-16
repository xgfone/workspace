#!/bin/sh

SUDO=sudo
INSTALLER=apt-get

$SUDO $INSTALLER install -y python-pip python3-pip
$SUDO pip install pylint nose pep8 jedi

