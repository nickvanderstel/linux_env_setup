# bash.sh
# place in /etc/profile.d/

# color prompt
if [ "$PS1" ]; then
    PS1='[\[\033[1;32m\]\u@\h \[\033[1;34m\]\W\[\033[0m\]]\$ '
fi

