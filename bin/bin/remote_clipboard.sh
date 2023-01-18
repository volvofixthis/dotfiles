#!/bin/bash
while (true); do echo "Waiting..." ;  nc -w 10 -l 127.0.0.1 1988 | xclip -i -selection clipboard; echo "Copied: "; xclip -o -selection clipboard | sed 's/^/  /'; done
