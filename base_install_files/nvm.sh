#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if ! command -v curl &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y curl
fi

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

if [[ -f ~/.zshrc ]]; then
	# The install script insists on adding bash completion, which we don't want.
	# It slows things down significantly on load, etc.
	sed -i '/\$NVM_DIR\/bash_completion/d' ~/.zshrc
fi

echo "NVM Installed - Run nvm install --lts to install latest node."
