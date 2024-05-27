#!/bin/bash

# Disable unattended upgrades
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades
# sudo apt-get purge unattended-upgrades
# I am lazy typing passwds
sudo sed -i 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers

# Install packages
sudo apt-get update
sudo apt-get install -y openssh-server htop tree jq glances 
# for pve only
#sudo apt-get install -y qemu-guest-agent 

# My preference
echo 'export EDITOR="nano"' >> ~/.bashrc
