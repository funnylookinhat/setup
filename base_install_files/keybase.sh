#!/bin/bash

set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

rm -rf keybase*

curl -L -o keybase.deb https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase.deb -y
sudo apt-get -f -y install
run_keybase

rm keybase.deb
