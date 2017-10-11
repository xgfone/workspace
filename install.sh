#!/bin/sh

SUDO=sudo
CWD=$HOME/.workspace
INSTALL="apt-get install"

if [ -f /etc/redhat-release ]; then
    INSTALL="yum install"
fi


install_app()
{
    $SUDO $INSTALL "$@"
}


ensure_app()
{
    for app in "$@"
    do
        which $app
        if [ $? -ne 0 ]; then
            install_app -y $app
        fi
    done
}

# Install the commom packages
ensure_app curl git ssh


# Get the workspace configure from Github
if ![ -d $CWD ]; then
    git clone git@github.com:xgfone/workspace $CWD && $CWD/install.sh && echo "Install successfully" && exit 0
    echo "Failed to install"
    exit $?
fi


# Install the fonts
$SUDO cp $CWD/fonts/* /usr/share/fonts && $SUDO fc-cache -v


# Install and configure git
install_app -y git && ln -s $CWD/gitconfig $HOME/.gitconfig


# Install and configure vim
install_app -y vim
curl -sLf https://spacevim.org/install.sh | bash 
ln -s $CWD/SpaceVim.d $HOME/.SpaceVim.d


# Install and configure i3wm
install_app -y i3 i3lock conky feh xcompmgr alsamixergui
ln -s $CWD/i3 $HOME/.config/i3


# Install the private.
if [ -x $CWD/private/install.sh ]; then
    $CWD/private/install.sh
fi

