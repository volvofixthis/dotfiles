#!/bin/bash
if [ "$OSNAME" == "darwin" ]; then
    OUTPUT=$(issw | sed -n -e 's/^com.apple.keylayout.\(.*\)$/\1/p')
    if [ "$OUTPUT" == "ABC" ]; then
        echo "[EN]"
    elif [ "$OUTPUT" == "RussianWin" ]; then
        echo "[RU]"
    fi
    exit
else
    [ ! "$(xset -q | grep LED | cut -c63)" == "" ] && echo "[RU]" || echo "[EN]"
fi
