#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

if ! command -v unzip &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y unzip
fi

echo "Installing awscli"

curl -L -o awscli.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
unzip awscli.zip

sudo ./aws/install
