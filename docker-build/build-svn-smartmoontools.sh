#!/bin/bash

apt install subversion -y
	
svn checkout ${SVN_REPOSITORY} svn-smartmontools

cd svn-smartmontools
./autogen.sh
./configure --without-initscriptdir --without-systemdsystemunitdir --without-libcap-ng --with-nvme-devicescan CXXFLAGS=-std=gnu++11 LDFLAGS=-static
make
sudo make install

/usr/local/sbin/smartctl --version

cp /usr/local/sbin/smartctl ${DIST}/smartctl
