#!/bin/bash
if [ "$OSNAME" == "darwin" ]; then
    OUTPUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -n -e 's/^.*KeyboardLayout Name" = \(.*\);$/\1/p')
    if [ "$OUTPUT" == "ABC" ]; then
        echo "[EN]"
    elif [ "$OUTPUT" == "RussianWin" ]; then
        echo "[RU]"
    fi
    exit
else
    [ ! "$(xset -q | grep LED | cut -c63)" == "" ] && echo "[RU]" || echo "[EN]"
fi
