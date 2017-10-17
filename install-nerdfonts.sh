#!/bin/sh
#
### Usage
#
# install-nerdfonts.sh [-c | --clean]
#   -c, --clean   Only clean the cache directory, not install the nerd fonts.
#

FONTS_NAME=NerdFonts
FONTS_DIR=$HOME/.local/share/fonts/$FONTS_NAME
GITHUB_HTTP='https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0'

TMP_DIR=$HOME/.cache/fonts/$FONTS_NAME
mkdir -p $TMP_DIR/$FONTS_NAME
mkdir -p $FONTS_DIR

if [ "Clean$1" == "Clean-c" ] || [ "Clean$1" == "Clean--clean" ]; then
    echo "Clean the cache directory $TMP_DIR/$FONTS_NAME"
    rm -rf $TMP_DIR/$FONTS_NAME
    exit 0
fi

download_and_install_font()
{
    FONT_DIR=$TMP_DIR/$FONTS_NAME/$1 && mkdir -p $FONT_DIR
    ZIP_SRC=$GITHUB_HTTP/$1.zip
    ZIP_DST=$TMP_DIR/$1.zip

    # Download
    if ! [ -f $ZIP_DST ]; then
        curl -sfL $ZIP_SRC >$ZIP_DST
        unzip -d $FONT_DIR $ZIP_DST
        if [ $? -ne 0 ]; then
            rm -rf $ZIP_DST $FONT_DIR
            echo "Failed to install the font $1"
            exit 1
        fi
    fi

    # Install
    FONTS_DST=$FONTS_DIR/$1
    if ! [ -d $FONTS_DST ]; then
        mv $FONT_DIR $FONTS_DST
    fi
}

# Download the nerd fonts.
#download_and_install_font 3270
#download_and_install_font AnonymousPro
download_and_install_font AurulentSansMono
download_and_install_font BitstreamVeraSansMono
download_and_install_font CodeNewRoman
download_and_install_font DejaVuSansMono
download_and_install_font DroidSansMono
download_and_install_font FantasqueSansMono
download_and_install_font FiraCode
download_and_install_font FiraMono
download_and_install_font Gohu
download_and_install_font Hack
download_and_install_font Hasklig
download_and_install_font HeavyData
download_and_install_font Hermit
download_and_install_font Inconsolata
download_and_install_font InconsolataGo
download_and_install_font Iosevka
download_and_install_font Lekton
download_and_install_font LiberationMono
download_and_install_font Meslo
download_and_install_font Monofur
download_and_install_font Monoid
download_and_install_font Mononoki
download_and_install_font MPlus
download_and_install_font ProFont
download_and_install_font ProggyClean
download_and_install_font RobotoMono
download_and_install_font ShareTechMono
download_and_install_font SourceCodePro
download_and_install_font SpaceMono
download_and_install_font Terminus
download_and_install_font Ubuntu
download_and_install_font UbuntuMono

# Rebuild the font cache.
fc-cache -vf

