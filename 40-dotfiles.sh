#!/bin/sh

alias dot="/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME"
git clone --bare https://github.com/rrotter/.dot.git $HOME/.dot

dot checkout

echo "Done!!"
echo "Close all terminal windows to make sure new .zshrc takes effect everywhere."
