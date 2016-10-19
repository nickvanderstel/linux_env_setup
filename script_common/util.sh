#!/bin/sh

# determine the type of OS the script is being run on
determine_os() {

    if [ -z "$OS_DETERMINED" ]; then
        OS_RELEASE_ID="unknown"
        OS_DETERMINED=1

        if [ -f /etc/os-release ]; then

            # if ID_LIKE is defined, go with that
            if [ -n "$(. /etc/os-release && echo $ID_LIKE)" ]; then
                OS_RELEASE_ID=$(. /etc/os-release && echo $ID_LIKE)
            else
                OS_RELEASE_ID=$(. /etc/os-release && echo $ID)
            fi
        fi
    fi
}


# determine if software is installed
is_installed () {
    if $(which $@); then
        true
    else
        false
    fi
}

ensure_root_access () {
    SUDO_CMD=''
    if [ $(id -u) -ne 0 ]; then
        # not running as root
        if $(sudo -v); then
            SUDO_CMD='SUDO'
        else
            echo "No root access, exiting..."
            exit
        fi
    fi
}
