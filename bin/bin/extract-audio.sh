#!/bin/bash
# Script to extract audio from video files

input_file="$1"
output_file="${input_file%.*}.mp3"

ffmpeg -i "$input_file" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$output_file"
