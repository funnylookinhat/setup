#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

echo "Installing saml2aws"

CURRENT_VERSION=2.27.1

curl -L -o saml2aws.tar.gz https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz
sudo tar -xzvf saml2aws.tar.gz -C /usr/local/bin/
sudo chmod +x /usr/local/bin/saml2aws
