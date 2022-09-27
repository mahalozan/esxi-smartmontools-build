#!/bin/bash

apt install git -y
	
git clone -b ${GIT_BRANCH} ${GIT_REPOSITORY} git-smartmontools

cd git-smartmontools/smartmontools
./autogen.sh
./configure --without-initscriptdir --without-systemdsystemunitdir --without-libcap-ng --with-nvme-devicescan CXXFLAGS=-std=gnu++11 LDFLAGS=-static
make
sudo make install

/usr/local/sbin/smartctl --version

cp /usr/local/sbin/smartctl ${DIST}/smartctl
