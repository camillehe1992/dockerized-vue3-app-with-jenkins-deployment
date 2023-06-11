#!/bin/sh
###################################################################
#
#   ,     #_
#   ~\_  ####_        Amazon Linux 2023
#  ~~  \_#####\
#  ~~     \###|
#  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
#   ~~       V~' '->
#    ~~~         /
#      ~~._.   _/
#         _/ _/
#       _/m/'
#
###################################################################

# Ensure that your software packages are up to date on your instance by using the following command to perform a quick software update
sudo yum update –y

# Add the Jenkins repo using the following command
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y

# Install JDK (Amazon Linux 2023)
sudo dnf install java-11-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y
# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins
# Start Jenkins as a service
sudo systemctl start jenkins
# Check the status of the Jenkins service
sudo systemctl status jenkins

# Optional
# Install Docker
sudo yum install docker -y
# Enable the Docker service to start at boot
sudo systemctl enable docker
# Start Docker as a service
sudo systemctl start docker
# Check the status of the Docker service
sudo systemctl status docker
# fix the permission denied issue when using docker in pipeline https://www.educative.io/answers/var-run-dockersock
sudo chmod 666 /var/run/docker.sock

# Install Nodejs including npm
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install nodejs -y

exit
