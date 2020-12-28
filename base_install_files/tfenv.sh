#!/bin/bash
set -euo pipefail

WORKDIR=$HOME/tmp/install
mkdir -p $WORKDIR
cd $WORKDIR

if [ -d "$HOME/.tfenv" ]; then
  echo "tfenv already installed"
  exit 0
fi

if ! command -v git &> /dev/null; then
  sudo apt-get update && sudo apt-get install -y git
fi

echo "Installing tfenv to ~/.tfenv"

git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
ln -s $HOME/.tfenv/bin/tfenv $HOME/bin/tfenv
