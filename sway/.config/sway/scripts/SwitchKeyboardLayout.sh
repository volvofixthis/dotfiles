#!/bin/bash
set -xe
keyboard=$1

notif="$HOME/.config/swaync/images/bell.png"

hyprctl switchxkblayout ${keyboard} next
current_layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.name == "'$keyboard'") | .active_keymap' | cut -c 1-2 | tr 'A-Z' 'a-z')

# notify-send -u low -i "$notif" "new KB_Layout: $current_layout"
