#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

# In case a previous build existed...
rm -rf go*

GOVERSION=$(curl https://golang.org/VERSION\?m=text)

echo "Installing golang - $GOVERSION"

curl -L -o go.tar.gz "https://dl.google.com/go/$GOVERSION.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf go.tar.gz
