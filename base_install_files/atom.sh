#!/bin/bash

set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

rm -rf atom*

curl -L -o atom.deb https://github.com/atom/atom/releases/download/v1.45.0/atom-amd64.deb
sudo apt install ./atom.deb -y
sudo apt-get -f -y install
rm atom.deb
