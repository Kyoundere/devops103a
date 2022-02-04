#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install nginx -y
sudo apt install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install pm2 -g
sudo npm install forever -g
sudo cp /srv/provisioning/vagrant/default /etc/nginx/sites-available/
sudo systemctl restart nginx
cd /srv/provisioning/Vagrant/app 
echo "export DB_HOST='mongodb://192.168.10.150:27017/posts'" >> ~/.bash_profile
source ~/.bash_profile
sudo npm install 
forever start app.js
