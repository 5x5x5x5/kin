#!/bin/bash
#This file directs the setup of RStuio server on an Ubuntu 12.04 LTS EC2 instance

# Let's add a user - 
# sudo adduser rstudio

# Alternately just setup a passwd for ubuntu
sudo passwd ubuntu
# write things twice

# update
sudo apt-get update

#install r
sudo apt-get install -y r-base

#install rstudio
sudo apt-get install -y gdebi-core
sudo apt-get install libapparmor1 # required only for Ubuntu
wget http://download2.rstudio.org/rstudio-server-0.98.507-amd64.deb
sudo gdebi rstudio-server-0.98.507-amd64.deb

# answer yes ans look for flag later

# Just checking...
sudo rstudio-server verify-installation

# in browser go to http://ec2-gobbledygook-1.amazonaws.com:8787
