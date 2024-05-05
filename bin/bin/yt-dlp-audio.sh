#!/bin/bash

filename=$(yt-dlp --get-filename -o "%(title)s.mp3" "$1")
filename="${filename//[\/\<\>\:\"\\\|\?\*]/_}" # Replace / < > : " \ | ? * with underscore to prevent issues with filesystem compatibility

yt-dlp -x --audio-format mp3 $1 --output "$filename"

ffmpeg -i "$filename" -ar 44100 -ab 192k -acodec libmp3lame -f mp3 "$filename.tmp" && mv "$filename.tmp" "$filename"

echo -e "\033[32mDownloaded to ${filename}\033[0m"
