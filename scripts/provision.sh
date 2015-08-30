#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

sudo apt-get update

sudo apt-get install -y nginx
sudo apt-get install -y nodejs
sudo apt-get install -y git
sudo apt-get install -y screen

# Databases
sudo apt-get install -y elasticsearch
sudo apt-get install -y redis-server
sudo apt-get install -y -q mariadb-server
sudo apt-get install -y mongodb
sudo apt-get install -y rabbitmq-server

# Database guis
sudo apt-get install -y kibana

sudo npm update -g

cp /vagrant/files/.bashrc ~/.bashrc

rm -rf /ect/nginx/sites-enabled/default
cp /vagrant/files/nginx_devenv.com /etc/nginx/sites-enabled/nginx_devenv.com