#!/bin/bash

#  Install Jenkins on Debian 10


sudo apt update

# import the Jenkins repository GPG keys
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
#Jenkins repository to your system
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the apt package list and install the latest version of Jenkins
sudo apt update
sudo apt install jenkins

sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=9080/g' /etc/default/jenkins

# Enable and start the Jenkins service by executing
sudo systemctl enable --now jenkins

sudo ufw allow 9080

sudo systemctl start jenkins