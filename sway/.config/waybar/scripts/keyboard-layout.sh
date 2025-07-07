#!/bin/bash
keyboard="$1"
OUTPUT=$(swaymsg -t get_inputs | jq '[.[] | select(.type == "keyboard") | select(.identifier == "'$keyboard'")][0].xkb_active_layout_name' -r | tr -d ')' | cut -d'(' -f2 | cut -c 1-2 | tr 'a-z' 'A-Z')
echo "${OUTPUT}"
