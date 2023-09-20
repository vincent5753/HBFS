#!/bin/bash

# Disable unattended upgrades
sudo systemctl stop unattended-upgrades
sudo systemctl disable unattended-upgrades
# sudo apt-get purge unattended-upgrades

# Install packages
sudo apt-get update
sudo apt-get install -y openssh-server htop tree jq qemu-guest-agent

# My preference
echo 'export EDITOR="nano"' >> ~/.bashrc
