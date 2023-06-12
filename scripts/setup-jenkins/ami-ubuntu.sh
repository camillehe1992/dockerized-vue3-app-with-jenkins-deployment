#!/bin/sh
###################################################################
#
# Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-1031-aws x86_64)
#
#  * Documentation:  https://help.ubuntu.com
#  * Management:     https://landscape.canonical.com
#  * Support:        https://ubuntu.com/advantage
#
#   System information as of Sun Jun 11 06:25:59 UTC 2023
#
###################################################################

# https://www.jenkins.io/doc/book/installing/linux/

# Ensure that your software packages are up to date on your instance by using the following command to perform a quick software update
sudo apt update –y

# This is the Debian package repository of Jenkins to automate installation and upgrade.
# To use this repository, first add the key to your system:
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc >/dev/null

# Add a Jenkins apt repository entry:
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list >/dev/null

# Update your local package index, then finally install Jenkins
sudo apt-get update
sudo apt-get install jenkins

# Install JAVA
sudo apt update
sudo apt install openjdk-11-jre
java -version

# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins
# Start Jenkins as a service
sudo systemctl start jenkins
# Check the status of the Jenkins service
sudo systemctl status jenkins

# Optional
# Install Docker
sudo apt update

# Install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# Add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

# Instlal Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04#step-4-working-with-docker-images
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker

# Executing the Docker Command Without Sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# fix the permission denied issue when using docker in pipeline https://www.educative.io/answers/var-run-dockersock
sudo chmod 666 /var/run/docker.sock

# Install Nodejs including npm
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo apt install nodejs npm -y

exit
