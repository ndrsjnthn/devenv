#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo mysql-server mysql-server/root_password password 123 | debconf-set-selections
echo mysql-server mysql-server/root_password_again password 123 | debconf-set-selections

#curl -sL https://deb.nodesource.com/setup_0.12 | bash -

#apt-get update

# Prereqs
apt-get install -y openjdk-7-jre

apt-get install -y nginx
apt-get install -y nodejs
apt-get install -y git
apt-get install -y screen

# Databases
# apt-get install -y redis-server
apt-get install -y -q mariadb-server
# apt-get install -y mongodb
# apt-get install -y rabbitmq-server

cp /vagrant/files/.bashrc ~/.bashrc

rm -rf /ect/nginx/sites-enabled/default
cp /vagrant/files/nginx_devenv.com /etc/nginx/sites-enabled/nginx_devenv.com

# Setting up mariadb.
mysql -u root --password=123 -e "GRANT ALL privileges ON *.* TO 'root'@'%'"
sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf
systemctl restart mysql.service

wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.tar.gz
wget https://download.elastic.co/kibana/kibana/kibana-4.1.2-linux-x64.tar.gz

mkdir /home/vagrant/elasticsearch
mkdir /home/vagrant/kibana
tar -xf elasticsearch-1.7.2.tar.gz -C /home/vagrant/elasticsearch --strip-components=1
tar -xf kibana-4.1.2-linux-x64.tar.gz -C /home/vagrant/kibana --strip-components=1

