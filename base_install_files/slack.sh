#!/bin/bash

set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

rm -rf slack*

curl -L -o slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.0-amd64.deb
sudo apt install ./slack.deb -y
sudo apt-get -f -y install
rm slack.deb
