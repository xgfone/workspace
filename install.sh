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

# Install and configure the commom packages
ensure_app curl git ssh
ln -s $CWD/gitconfig $HOME/.gitconfig


# Get the workspace configure from Github
if ! [ -d $CWD ]; then
    git clone https://github.com/xgfone/workspace $CWD && bash -x $CWD/install.sh && echo "Install successfully" && exit 0
    exit_code=$?
    echo "Failed to install"
    exit $exit_code
fi


# Install the fonts
$SUDO cp $CWD/fonts/* /usr/share/fonts && $SUDO fc-cache -v


# Install and configure vim
ensure_app vim
if ! [ -d $HOME/.SpaceVim ]; then
    curl -sLf https://spacevim.org/install.sh | bash 
    ln -s $CWD/SpaceVim.d $HOME/.SpaceVim.d
fi

# Install and configure i3wm
ensure_app i3 i3lock conky feh xcompmgr alsamixergui
ln -s $CWD/i3 $HOME/.config/i3


# Install the bin
HOME_BIN=$HOME/bin
if ! [ -d $HOME_BIN ]; then
    mkdir -p $HOME_BIN
fi
ln -s $CWD/bin/set-display-resolution.sh $HOME_BIN/set-display-resolution.sh


# Install the private.
if [ -x $CWD/private/install.sh ]; then
    $CWD/private/install.sh
fi

