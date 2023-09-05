#!/bin/bash

# install packages using Homebrew
brew install p7zip
brew install --cask wireshark
sudo chown $(whoami):admin /dev/bp*
