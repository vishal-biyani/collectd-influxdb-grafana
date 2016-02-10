#!/bin/bash

#
# Install collectd and its pre-requisites 
#
sudo yum install -y bzip2 wget
sudo yum install -y make automake gcc gcc-c++ kernel-devel perl-devel
cd /tmp/
sudo wget https://collectd.org/files/collectd-5.5.0.tar.bz2
sudo tar -jxf collectd-5.5.0.tar.bz2
cd collectd-5.5.0
export CFLAGS="-Wno-error"
sudo ./configure
sudo make all install

cd /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/martin-magakian/collectd-script/master/collectd.service
sudo chmod +x collectd.service
