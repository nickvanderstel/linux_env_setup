#!/bin/bash

# make sure links are set up
. ./link_config.sh


. $HOME/.config/script_common/util.sh
determine_os

. $HOME/.config/script_common/install.sh


if ! is_installed git; then
    install_git
else
    echo "git already installed"
fi


if ! is_installed python3; then
    install_python
else
    echo "python3 already installed"
fi


if ! is_installed ctags; then
    install_ctags
else
    echo "python3 already installed"
fi


if ! is_installed nvim; then
    install_neovim
else
    echo "nvim already installed"
fi
