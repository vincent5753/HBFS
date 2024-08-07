#!/bin/bash

# Tested on Ubuntu 20.04

# Disable unattended upgrades
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades

# Not a fan of snap
sudo systemctl disable --now snapd
sudo systemctl disable --now snapd.service
sudo systemctl disable --now snapd.socket
sudo systemctl disable --now snapd.seeded
sudo systemctl disable --now snapd.snap-repair.timer
systemctl status snapd

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
