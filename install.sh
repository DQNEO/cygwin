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

# install development tools
apt-cyg install emacs zsh screen 

# clone and make install git latest version
git clone git://github.com/git/git.git ~/src/git
cd ~/src/git
make configure
./configure --prefix=/usr/local
make all
make install

# use new git
alias git=/usr/local/bin/git

