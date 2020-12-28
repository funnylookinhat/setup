#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

echo "Installing vault"

CURRENT_VERSION=1.6.1
curl -L -o vault.zip https://releases.hashicorp.com/vault/${CURRENT_VERSION}/vault_${CURRENT_VERSION}_linux_amd64.zip
unzip vault.zip
sudo mv vault /usr/local/bin/
