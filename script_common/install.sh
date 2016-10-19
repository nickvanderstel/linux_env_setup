#!/bin/bash

. $HOME/.config/script_common/util.sh
determine_os


install_git () {
    ensure_root_access

    echo "Installing git"
    case "$OS_RELEASE_ID" in
        "fedora")
            $SUDO_CMD dnf -y install git
            ;;
    esac
}


install_python () {
    ensure_root_access

    echo "Installing python"
    case "$OS_RELEASE_ID" in
        "fedora")
            $SUDO_CMD dnf -y install python python3 python-pip python3-pip
            ;;
    esac
}


install_neovim () {
    ensure_root_access

    echo "Installing neovim"
    case "$OS_RELEASE_ID" in
        "fedora")
            $SUDO_CMD dnf -y install dnf-plugins-core
            $SUDO_CMD dnf -y install copr enable dperson/neovim
            $SUDO_CMD dnf -y install neovim
            $SUDO_CMD pip3 install neovim
            ;;
    esac
}
