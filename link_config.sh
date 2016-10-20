#/bin/bash

mkdir -p $HOME/.config

ln -snf $(pwd)/bash/.bashrc $HOME/.bashrc
ln -snf $(pwd)/git/.gitconfig $HOME/.gitconfig
ln -snf $(pwd)/nvim $HOME/.config/nvim
ln -snf $(pwd)/script_common $HOME/.config/script_common

