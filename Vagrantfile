# -*- mode: ruby -*-
# vi: set ft=ruby :

projectPath = "C:/programming"

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/jessie64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601

  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder projectPath, "/projects"
  config.vm.provider "virtualbox"

  config.vm.provision "shell", path: "./scripts/provision.sh"
  config.vm.provision "shell", path: "./scripts/startup.sh", run: "always"
end
