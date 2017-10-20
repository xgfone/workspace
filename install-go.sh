#!/bin/sh

SUDO=sudo

if [ -z $GOPATH ]; then
    GOPATH=$HOME/go
fi

GOPATH_BIN=$GOPATH/bin
GOPATH_SRC=$GOPATH/src

GOLANG_SRC=$GOPATH_SRC/golang.org/x
GOLANG_GITHUB_URL=https://github.com/GOLANG
mkdir -p $GOLANG_SRC $GOPATH_BIN

download_golang_package()
{
    if ! [ -d $GOLANG_SRC/$1 ]; then
        git clone $GOLANG_GITHUB_URL/$1 $GOLANG_SRC/$1
    fi
}

download_go_package_from_github()
{
    package_dst=github.com/$1
    if [ -n $2 ]; then
        package_dst=$2
    fi

    if ! [ -d $GOPATH_SRC/$package_dst ]; then
        git clone https://github.com/$1 $GOPATH_SRC/$package_dst
    fi
}

download_golang_package crypto
download_golang_package exp
download_golang_package image
download_golang_package mobile
download_golang_package sys
download_golang_package text
download_golang_package time
download_golang_package tools
download_go_package_from_github 'dominikh/go-tools' 'honnef.co/go/tools'
go install 'honnef.co/go/tools/cmd/...'

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

