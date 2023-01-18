#!/bin/bash
while (true); do echo "Waiting..." ;  nc -w 10 -l 1988 | xclip -i -selection clipboard; echo "Copied: "; xclip -o -selection clipboard | sed 's/^/  /'; done
