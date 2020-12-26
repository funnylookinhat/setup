#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

sudo apt-get update && sudo apt-get install -y docker.io

# DNS Points to AWS
# Necessary for run-remote scripts
echo '{"insecure-registries":["registry.roger.dal.moz.com:5000"],"dns":["10.40.0.2"]}' | sudo tee /etc/docker/daemon.json

sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
sudo cp docker-compose /usr/local/bin/docker-compose
