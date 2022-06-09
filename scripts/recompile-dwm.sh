#!/bin/sh

# Recompiles dwm with pywal colors.
HEADER_FILE=$HOME/.cache/wal/colors-wal-dwm.h
TEMP_FILE=temp-colors-wal-dwm
DWM_DIR=$HOME/.sources/dwm

grep -v "urg" "$HEADER_FILE" > $TEMP_FILE
mv "$TEMP_FILE" "$HEADER_FILE" #Shellcheck complained about reading and writing to the same file so I came up with this solution.
rm "$TEMP_FILE"

cd "$DWM_DIR" && make -s && sudo make -s install || doas make -s install && make -s clean
cd - > /dev/null || exit
