#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo mysql-server mysql-server/root_password password 123 | debconf-set-selections
echo mysql-server mysql-server/root_password_again password 123 | debconf-set-selections

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

sudo apt-get update

# Prereqs
sudo apt-get install -y openjdk-7-jre

sudo apt-get install -y nginx
sudo apt-get install -y nodejs
sudo apt-get install -y git
sudo apt-get install -y screen

# Databases
sudo apt-get install -y redis-server
sudo apt-get install -y -q mariadb-server
sudo apt-get install -y mongodb
sudo apt-get install -y rabbitmq-server

wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.0.0-beta1/elasticsearch-2.0.0-beta1.deb
dpkg -i elasticsearch-2.0.0-beta1.deb

cp /vagrant/files/configs/elasticsearch.yml /etc/elaticsearch/elasticsearch.yml
chown -R elasticsearch:elasticsearch /etc/elasticsearch

sudo npm update -g

cp /vagrant/files/.bashrc ~/.bashrc

rm -rf /ect/nginx/sites-enabled/default
cp /vagrant/files/nginx_devenv.com /etc/nginx/sites-enabled/nginx_devenv.com

sudo echo "127.0.0.1 devenv" >> /etc/hosts
