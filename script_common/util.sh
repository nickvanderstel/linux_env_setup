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


# determine if a package is installed
is_installed () {
    determine_os

    case "$OS_RELEASE_ID" in
        "fedora")
            if dnf list installed "$@" >/dev/null 2>&1; then
                true
            else
                false
            fi
            ;;
        "debian")
            if dpkg -s "$@" >/dev/null 2>&1; then
                true
            else
                false
            fi
            ;;
        *)
            # uknown os, exit
            echo "Unknown OS type, exiting..."
            exit
            ;;
    esac
}
