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
    sep=\"":"\"
    for app in "$@"
    do
        apps=\"$app\"
        out=`python -c "print "$apps".find($sep)"`
        if [ "$out" == "-1" ]; then
            app_name=$app
            package_name=$app
        else
            app_name=`echo $app | cut -d : -f 1`
            package_name=`echo $app | cut -d : -f 2`
        fi

        which $app_name
        if [ $? -ne 0 ]; then
            install_app -y $package_name
        fi
    done
}

# Install and configure the commom packages
# Notice: ctags is exuberant-ctags.
ensure_app curl git ssh:ssh sshd:ssh axel wget ctags
ln -s $CWD/gitconfig $HOME/.gitconfig


# Get the workspace configure from Github
if ! [ -d $CWD ]; then
    git clone https://github.com/xgfone/workspace $CWD && bash -x $CWD/install.sh && echo "Install successfully" && exit 0
    exit_code=$?
    echo "Failed to install"
    exit $exit_code
fi

if [ "ARG$1" == "ARG--all" ]; then
    bash -x $CWD/install-all.sh
    exit $?
fi

# Install the fonts
cp $CWD/fonts/* $HOME/.local/share/fonts && fc-cache -fv


# Install and configure vim
ensure_app vim
if ! [ -d $HOME/.SpaceVim ]; then
    curl -sLf https://spacevim.org/install.sh | bash
    ln -s $CWD/SpaceVim.d $HOME/.SpaceVim.d
fi

# Install and configure i3wm
ensure_app i3 i3lock conky feh xcompmgr alsamixergui
ln -s $CWD/i3 $HOME/.config/i3
$SUDO sed -i 's/^user-session=.*/user-session=i3/g' /etc/lightdm/lightdm.conf
$SUDO sed -i 's/^#user-session=.*/user-session=i3/g' /etc/lightdm/lightdm.conf


# Install the bin
HOME_BIN=$HOME/bin
if ! [ -d $HOME_BIN ]; then
    mkdir -p $HOME_BIN
fi
ln -s $CWD/bin/set-display-resolution.sh $HOME_BIN/set-display-resolution.sh


# Install the private.
if [ -f $CWD/private/install.sh ]; then
    bash -x $CWD/private/install.sh
fi

