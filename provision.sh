#!/bin/bash

#update packages
sudo apt update -y
sudo apt install nodejs -y
node -v
sudo apt install npm
mv -R /vagrant/devops-rampup/movie-analyst-ui/ /opt/movie-analyst-ui

#sudo apt upgrade -y




