#!/bin/bash

#Docker Install
echo 'Removing previous installations of Docker'
sudo apt-get update -y &>>/dev/null
sudo apt-get install bridge-utils -y &>>/dev/null 
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli containerd runc &>>/dev/null
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce containerd runc &>>/dev/null
sudo rm -rf /var/lib/docker /etc/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo ifconfig docker0 down
sudo brctl delbr docker0

echo 'Updating APT Repositories'
sudo apt-get update -y &>>/dev/null

echo 'Installing Docker Requierments'
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y &>>/dev/null

echo 'Setting up Docker Repository'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &>>/dev/null
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &>>/dev/null

echo 'Updating APT Repositories'
sudo apt-get update -y &>>/dev/null

echo 'Installing Docker'
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &>>/dev/null

echo 'Installing Docker-Compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &>>/dev/null
sudo chmod +x /usr/local/bin/docker-compose &>>/dev/null

echo 'Start Docker Services'
sudo service docker start

#Creates the main docker folder for storing configurations
echo 'Creating Main Docker Configuration Folder'
sudo rm -R /mnt/docker
sudo mkdir /mnt/docker

#Creates configuration folders for Samba
echo 'Creating Samba Configuration Folders'
sudo mkdir -p /mnt/docker/smbwebmin/webmin
sudo mkdir -p /mnt/docker/smbwebmin/samba/etc
sudo mkdir -p /mnt/docker/smbwebmin/samba/var/lib