#!/bin/bash

#make dir
cd /home/sitiys/
sudo mkdir docker
cd docker
sudo mkdir app
cd app
sudo mkdir docker-onlyoffice-nextcloud

#updating system, installing git,docker and docker-compose
sudo apt update && sudo apt upgrade -y
sudo apt install nano curl -y
echo "---------------Starting docker instalation---------------"
sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
apt-cache madison docker-ce
sudo apt-get install docker-ce=<5:19.03.1~3-0~ubuntu-xenial> docker-ce-cli=<5:19.03.1~3-0~ubuntu-xenial> containerd.io -y
sudo apt update && sudo apt upgrade -y
sudo apt-get -y install python-pip
sudo pip install docker-compose
sudo pip install --upgrade pip
echo "---------------Done---------------"
echo "----------------------------------"
echo "----------Run git-clone-----------"
git clone https://github.com/sitiys/excloud.git

#set up way
sudo cp -r excloud/* docker-onlyoffice-nextcloud/
sudo rm -rf excloud
cd docker-onlyoffice-nextcloud

#installing apache2 setrbot
echo "----BEGIN INSTALLATION----"
sudo apt update
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt update && sudo apt upgrade -y
sudo apt install python-certbot-apache -y
sudo service apache2 restart
sudo mkdir -p certs
echo "-----------DONE-----------"
echo "-----You must to stop apache2-----"
echo "--service befote starting compose-"
echo "-------Edit your nginx conf and---"
echo "------set up SSL LetsEncrypt srt--"
echo "----------------------------------"
