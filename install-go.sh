#!/bin/sh

SUDO=sudo

if [ -z $GOPATH ]; then
    GOPATH=$HOME/go
fi

GOPATH_BIN=$GOPATH/bin
GOPATH_SRC=$GOPATH/src
GOLANG_SRC=$GOPATH_SRC/golang.org/x
mkdir -p $GOLANG_SRC $GOPATH_BIN

if ! [ -d $GOLANG_SRC/crypto ]; then
    git clone https://github.com/golang/crypto  $GOLANG_SRC/crypto
fi 

if ! [ -d $GOLANG_SRC/exp ]; then 
    git clone https://github.com/golang/exp     $GOLANG_SRC/exp
fi

if ! [ -d $GOLANG_SRC/image ]; then 
    git clone https://github.com/golang/image   $GOLANG_SRC/image
fi 

if ! [ -d $GOLANG_SRC/mobile ]; then
    git clone https://github.com/golang/mobile  $GOLANG_SRC/mobile
fi

if ! [ -d $GOLANG_SRC/sys ]; then
    git clone https://github.com/golang/sys     $GOLANG_SRC/sys
fi

if ! [ -d $GOLANG_SRC/text ]; then
    git clone https://github.com/golang/text    $GOLANG_SRC/text
fi

if ! [ -d $GOLANG_SRC/time ]; then
    git clone https://github.com/golang/time    $GOLANG_SRC/time
fi

if ! [ -d $GOLANG_SRC/tools ]; then
    git clone https://github.com/golang/tools   $GOLANG_SRC/tools
fi

if [ "ARG$1" != "ARG--all" ]; then
    exit 0
fi

# Download go bin package.
version=1.9.1
platfom=linux

package=go${version}.${platform}-amd64.tar.gz
URL1=https://storage.googleapis.com/golang/$package
URL2=https://golangtc.com/static/go/$version/$package

curl -sfL $URL1 > /tmp/$package
if [ $? -ne 0 ]; then
    curl -sfL $URL2 >/tmp/$package
fi
if [ $? -ne 0 ]; then
    echo "Failed to the go package(version=$version, platfom=$platfom)"
    exit 1
fi

if [ -d /usr/local/go ]; then
    $SUDO mv /usr/local/go /usr/local/go_bak
fi
$SUDO tar xf /tmp/$package -C /usr/local

