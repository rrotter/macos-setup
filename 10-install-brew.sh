#!/bin/sh

# install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
  # per https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "homebrew is already installed!"
fi
