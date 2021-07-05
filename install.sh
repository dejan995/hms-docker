#!/bin/bash

# Updating APT Repos
echo '####################################################'
echo 'Updating APT Repositories'
echo '####################################################'
sudo apt-get update -y &>>/dev/null

# Removing previos Docker Install
echo '####################################################'
echo 'Removing previous installations of Docker'
echo '####################################################'
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli containerd runc &>>/dev/null
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce containerd runc &>>/dev/null
sudo rm -rf /var/lib/docker &>>/dev/null
sudo rm -rf /var/lib/containerd &>>/dev/null

echo '####################################################'
echo 'Removing Docker Compose'
echo '####################################################'
sudo rm /usr/local/bin/docker-compose &>>/dev/null

# Install Docker requierments
echo '####################################################'
echo 'Installing Docker Requierments'
echo '####################################################'
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release -y &>>/dev/null

# Set up Docker Repo
echo '####################################################'
echo 'Setting up Docker Repository'
echo '####################################################'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &>>/dev/null
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update APT Repos
echo '####################################################'
echo 'Updating APT Repositories'
echo '####################################################'
sudo apt-get update -y &>>/dev/null

# Install Docker
echo '####################################################'
echo 'Installing Docker'
echo '####################################################'
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &>>/dev/null

# Install Docker-Compose
echo '####################################################'
echo 'Installing Docker-Compose'
echo '####################################################'
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &>>/dev/null
sudo chmod +x /usr/local/bin/docker-compose &>>/dev/null

# Creates the Main docker folder for storing configurations
echo '####################################################'
echo 'Creating Main Docker Configuration Folder'
echo '####################################################'
sudo rm -R /mnt/docker &>>/dev/null
sudo mkdir /mnt/docker

# Creates the Main Media folder for storing media files.
echo '####################################################'
echo 'Creating Main Media Folder'
echo '####################################################'
sudo rm -R /mnt/media &>>/dev/null
sudo mkdir /mnt/media

echo '####################################################'
echo 'Creating Downloads Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/downloads/complete

echo '####################################################'
echo 'Creating TV shows Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/tv

echo '####################################################'
echo 'Creating Movies Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/movies

echo '####################################################'
echo 'Creating Music Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/music

echo '####################################################'
echo 'Creating Videos Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/videos

echo '####################################################'
echo 'Creating Torrents Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/torrents

echo '####################################################'
echo 'Creating Books Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/books

echo '####################################################'
echo 'Creating Comics Folder'
echo '####################################################'
sudo mkdir -p /mnt/media/comics

# Starts ALL Docker Containers
echo '####################################################'
echo 'Starting Docker Containers'
echo '####################################################'
sudo docker-compose up -d
