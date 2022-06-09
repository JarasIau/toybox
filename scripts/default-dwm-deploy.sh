#!/bin/sh
#This script deploys all of the suckless software that I use. Slock, however won't work as it requires minimal configuration. You can recompile it.

CONFIG_DIR=$HOME/.sources
GIT_REMOTE="https://git.suckless.org"
REPOS="dwm dmenu st slock slstatus"

mkdir -p "$CONFIG_DIR" && cd "$CONFIG_DIR" || exit

echo "$REPOS" | tr ' ' '\n' | while read -r ELEMENT; do \
    git clone "$GIT_REMOTE/$ELEMENT" ./"$ELEMENT" && \
        cd "$ELEMENT" && make -s && sudo make -s install clean || doas make -s install clean \
        cd .. || exit 
done
