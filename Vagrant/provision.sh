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
echo "export DB_HOST='mongodb://34.242.2.86:27017/posts'" >> ~/.bash_profile
source ~/.bash_profile
sudo npm install 
forever start app.js



cd app 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install
screen -d -m npm start
exit

git checkout main
git pull origin main
git merge origin/dev
git push origin main
scp -o "StrictHostKeyChecking=no" -v -r app ubuntu@ec2-54-195-167-174.eu-west-1.compute.amazonaws.com:~ 
ssh -o "StrictHostKeyChecking=no" -v -tt ubuntu@ec2-54-195-167-174.eu-west-1.compute.amazonaws.com << EOF
cd app 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo cp default /etc/nginx/sites-available/
sudo systemctl restart nginx
echo "export DB_HOST='mongodb://34.250.46.58:27017/posts'" >> ~/.bash_profile
source ~/.bash_profile
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install
node seeds/seed.js
screen -d -m npm start
exit

EOF



cd app 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install
screen -d -m npm start
exit

EOF