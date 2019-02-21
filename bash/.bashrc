# .bashrc


fedora_bashrc() {
    # Source global definitions
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi
}


. $HOME/.config/script_common/util.sh
determine_os


case "$OS_RELEASE_ID" in
    "fedora")
        fedora_bashrc
        ;;
esac

PATH=$HOME/.local/bin:$PATH
export PATH

# color prompt
if [ "$PS1" ]; then
    PS1='[\[\033[1;32m\]\u@\h \[\033[1;34m\]\W\[\033[0m\]]\$ '
fi


# aliases
alias ll='ls -al --color=auto' 2>/dev/null
alias l.='ls -d .* --color=auto' 2>/dev/null
alias ls='ls --color=auto' 2>/dev/null
