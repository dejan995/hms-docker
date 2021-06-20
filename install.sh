#!/bin/bash

#Docker Install
echo 'Removing previos installations of Docker'
sudo apt-get remove docker docker-engine docker.io containerd runc > /dev/null 2>&1
echo 'Updating APT Repositories'
sudo apt-get update -y > /dev/null 2>&1
echo 'Installing Docker Requierments'
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y > /dev/null 2>&1
echo 'Setting up Docker Repository'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /dev/null 2>&1
echo 'Updating APT Repositories'
sudo apt-get update -y > /dev/null 2>&1
echo 'Installing Docker'
sudo apt-get install docker-ce docker-ce-cli containerd.io -y > /dev/null 2>&1
echo 'Installing Docker-Compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1
sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1

#Creates the main docker folder for storing configurations
echo 'Creating Main Docker Configuration Folder'
sudo rm -R /mnt/docker
sudo mkdir /mnt/docker

#Creates configuration folders for Samba
echo 'Creating Samba Configuration Folders'
sudo mkdir -p /mnt/docker/smbwebmin/webmin
sudo mkdir -p /mnt/docker/smbwebmin/samba/etc
sudo mkdir -p /mnt/docker/smbwebmin/samba/var/lib