#!/bin/sh

CWD=$HOME/.workspace

ARGS="--all"

if [ -f $CWD/install.sh ]; then
    $CWD/install.sh || exit 1
else
    curl -sLf https://github.com/xgfone/workspace/raw/master/install.sh | bash
    if [ $? -ne 0 ]; then
        echo "Failed to intall all the packages."
        exit 1
    fi
fi

$CWD/install-fcitx.sh $ARGS || exit 1
$CWD/install-go.sh $ARGS || exit 1
$CWD/install-yixin.sh $ARGS || exit 1
$CWD/install-youdao-note.sh $ARGS || exit 1
$CWD/install-wechat.sh $ARGS || exit 1
$CWD/install-dbeaver.sh $ARGS || exit 1
$CWD/install-pip.sh $ARGS || exit 1
$CWD/install-nerdfonts.sh $ARGS || exit 1
$CWD/install-zsh.sh $ARGS || exit 1
