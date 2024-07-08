#!/bin/bash
keyboard=$1
OUTPUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "'$keyboard'") | .active_keymap' | cut -c 1-2 | tr 'a-z' 'A-Z')
echo "${OUTPUT}"
