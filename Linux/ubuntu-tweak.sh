#!/bin/bash

# disable unattended upgrades
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades
# sudo apt-get purge unattended-upgrades

# install packages
sudo apt-get update
sudo apt-get install -y openssh-server htop tree jq