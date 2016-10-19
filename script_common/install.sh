#!/bin/bash

. $HOME/.config/script_common/util.sh
determine_os


install_python () {
    ensure_root_access

    case "$OS_RELEASE_ID" in
        "fedora")
            echo "Installing python"
            $SUDO_CMD dnf -y install python python3 python-pip python3-pip
            ;;
    esac
}


install_neovim () {
    ensure_root_access

    case "$OS_RELEASE_ID" in
        "fedora")
            echo "Installing neovim"
            $SUDO_CMD dnf -y install dnf-plugins-core
            $SUDO_CMD dnf -y install copr enable dperson/neovim
            $SUDO_CMD dnf -y install neovim
            $SUDO_CMD pip3 install neovim
            ;;
    esac
}
