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
apt-cyg install nano colordiff

# clone and make install git latest version
install_git () {
git clone git://github.com/git/git.git ~/src/git
cd ~/src/git
make configure
./configure --prefix=/usr/local
make all
make install

# use new git
alias git=/usr/local/bin/git
}

[[ -e /usr/local/bin/git ]] || install_git

install_perl () {
# plenvを取得
git clone git://github.com/tokuhirom/plenv.git ~/.plenv/

# Perl-Buildを取得
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

# パス設定など
echo 'export PATH=~/.plenv/bin:~/.plenv/shims/:$PATH' >> ~/.bashrc
echo 'eval "$(plenv init -)"' >> ~/.bashrc

# シェルにログインしなおす
$SHELL -l

perl_version=5.20.0
# perl をインストール
plenv install $perl_version
plenv global $perl_version

# cpanmをインストール
plenv install-cpanm
plenv rehash
}

install_perl
