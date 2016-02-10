#!/bin/bash

#
# Variables
#

HOST=$(hostname);

#
# Adding host entries
#
sudo /vagrant/scripts/appendHosts.sh

#
# Configuring collectd and influxdb
#
sudo mv /opt/collectd/etc/collectd.conf /opt/collectd/etc/collectd.conf_orig
sudo cp /vagrant/templates/collectd.conf.tmpl /opt/collectd/etc/collectd.conf


sudo sed -i "s|%HOSTNAME%|$HOST|g" /opt/collectd/etc/collectd.conf

# Disable firewall in centos 7
# else VM's cant communicate
sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service
sudo service collectd start
#
# Test Command 
#
#curl -G http://agent1.hs.com:8086/query?pretty=true --data-urlencode "db=collectd_db" --data-urlencode "q=show series"
