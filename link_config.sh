#/bin/bash

mkdir -p $HOME/.config

ln -sf $(pwd)/git/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/nvim $HOME/.config/nvim

