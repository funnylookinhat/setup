#!/bin/bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

echo "Updating at sources"
sudo apt-get update

echo "Updating all packages"
sudo apt-get dist-upgrade -y

echo "Setting up ZSH"
sudo apt-get install -y zsh
sudo chsh -s `which zsh` $(whoami)

echo "Installing dev packages"
sudo apt-get install -y \
  git apt-transport-https ca-certificates curl \
  software-properties-common jq \
  postgresql-client mysql-client \
  openconnect libsecret-tools gpa \
  byobu

echo "Configuring git"
# Optionally run this if you have a GUI
# git config --global merge.tool meld
git config --global user.name "David Overcash"
git config --global user.email funnylookinhat@gmail.com

# TODO
# Install files for: saml2js, awscli, tfenv, etc.

for INSTALL_FILE in $(find base_install_files/ -type f); do
  echo "Running $INSTALL_FILE"
  ./$INSTALL_FILE
done;
