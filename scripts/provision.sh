#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo mysql-server mysql-server/root_password password 123 | debconf-set-selections
echo mysql-server mysql-server/root_password_again password 123 | debconf-set-selections

#curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

#sudo apt-get update

# Prereqs
sudo apt-get install -y openjdk-7-jre

sudo apt-get install -y nginx
sudo apt-get install -y nodejs
sudo apt-get install -y git
sudo apt-get install -y screen

# Databases
# sudo apt-get install -y redis-server
# sudo apt-get install -y -q mariadb-server
# sudo apt-get install -y mongodb
# sudo apt-get install -y rabbitmq-server

cp /vagrant/files/.bashrc ~/.bashrc

rm -rf /ect/nginx/sites-enabled/default
cp /vagrant/files/nginx_devenv.com /etc/nginx/sites-enabled/nginx_devenv.com
