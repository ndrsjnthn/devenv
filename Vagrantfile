# -*- mode: ruby -*-
# vi: set ft=ruby :

# Fixing path for cygwin.
# mount -c /
# mount -m > /etc/fstab
projectPath = "c:/programming"

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/jessie64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3001, host: 3001
  config.vm.network "forwarded_port", guest: 9999, host: 9999
  config.vm.network "forwarded_port", guest: 6379, host: 6379

  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder projectPath, "/projects", type: "rsync",
    rsync__args: ["--verbose", "--archive"]

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 4]
  end


  config.vm.provision "shell", path: "./scripts/provision.sh"
  config.vm.provision "shell", path: "./scripts/startup.sh", run: "always"
end
