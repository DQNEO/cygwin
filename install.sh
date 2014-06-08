#!/bin/bash

set -e
set -o

# install apt-cyg

wget https://raw.githubusercontent.com/kou1okada/apt-cyg/master/apt-cyg -O /usr/local/bin/apt-cyg
chmod +x /usr/local/bin/apt-cyg

# set mirror
apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update
 

# install packages
apt-cyg install curl
apt-cyg install make gcc-core autoconf gcc-g++ zlib-devel libiconv libiconv-devel
apt-cyg install git
