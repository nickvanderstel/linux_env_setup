#/bin/bash

mkdir -p $HOME/.config

ln -sf $(pwd)/bash/.bashrc $HOME/.bashrc
ln -sf $(pwd)/git/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/script_common $HOME/.config/script_common

