#!/bin/bash
set -e
if [ -n "$DISPLAY" ]; then
    xclip -o -selection clipboard
    exit
elif [ -n "$TMUX" ]
then
    tmux save-buffer -
    exit
fi
