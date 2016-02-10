# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

GRAFANA_MEMORY=1024
AGENT_MEMORY=512
GRAFANA_INSTANCES=1
AGENT_INSTANCES=3

AGENT_SUBNET="192.168.17"
GRAFANA_ADDRESS="192.168.17.99"

DOMAIN_NAME="hs.com"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	AGENT_INSTANCES.times do |i|
		config.vm.define "collectd_agent_#{i+1}" do |agent|
			agent.vm.box = "puppetlabs/centos-7.0-64-puppet"
			agent.vm.box_check_update = false
			agent.vm.network "private_network", ip: "#{AGENT_SUBNET}.#{i+10}"
			agent.vm.hostname = "agent#{i+1}.#{DOMAIN_NAME}"
			agent.vm.provider :virtualbox do |vba|
				vba.customize ["modifyvm", :id, "--memory", AGENT_MEMORY]
			end
			agent.vm.provision "shell", path: "scripts/installAgent.sh"
			agent.vm.provision "shell", path: "scripts/configureAgent.sh"
		end
	end
	GRAFANA_INSTANCES.times do |i|
		config.vm.define "db" do |graf|
			graf.vm.box = "puppetlabs/centos-7.0-64-puppet"
			graf.vm.box_check_update = false
			graf.vm.network "private_network", ip: "#{GRAFANA_ADDRESS}"
			graf.vm.hostname = "db.hs.com"
			
			graf.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", GRAFANA_MEMORY]
			end
			graf.vm.provision "shell", path: "scripts/configureGrafana.sh"
		end
	end	
end