sudo chmod a+x /vagrant/scripts/appendHosts.sh
sudo /vagrant/scripts/appendHosts.sh

sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service
sudo yum -y install https://grafanarel.s3.amazonaws.com/builds/grafana-2.6.0-1.x86_64.rpm

sudo systemctl daemon-reload
sudo systemctl start grafana-server
#
# Install InfluxDB
#
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
sudo yum install -y influxdb

sudo cp /vagrant/templates/types.db /usr/share/types.db
sudo mv /etc/influxdb/influxdb.conf /etc/influxdb/influxdb.conf_orig
sudo cp /vagrant/templates/influxdb.conf.tmpl /etc/influxdb/influxdb.conf

sudo sed -i "s|%HOSTNAME%|$HOST|g" /etc/influxdb/influxdb.conf

sudo rm -rf /var/lib/influxdb/meta/*

sudo systemctl stop firewalld.service 
sudo systemctl disable firewalld.service

sudo service influxdb start