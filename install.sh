#!/bin/bash

# install apt-cyg
curl https://raw.githubusercontent.com/kou1okada/apt-cyg/master/apt-cyg > /usr/local/bin/apt-cyg
chmod +x /usr/local/bin/apt-cyg

# set mirror
apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update
# 
# apt-cyg install git
