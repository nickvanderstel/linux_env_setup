#!/bin/bash

. $HOME/.config/script_common/util.sh
determine_os

. $HOME/.config/script_common/install.sh


# make sure links are set up
. ./link_config.sh


if !is_installed(git); then
    install_git
fi


if !is_installed(python3); then
    install_python
fi


if !is_installed(nvim); then
    install_neovim
fi
