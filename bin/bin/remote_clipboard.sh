#!/bin/bash
is_app_installed() {
  type "$1" &>/dev/null
}

# Resolve copy backend: pbcopy (OSX), reattach-to-user-namespace (OSX), xclip/xsel (Linux)
copy_backend=""
echo "Searching backend"
if is_app_installed pbcopy; then
  copy_backend="pbcopy"
elif is_app_installed reattach-to-user-namespace; then
  copy_backend="reattach-to-user-namespace pbcopy"
elif [ -n "${DISPLAY-}" ] && is_app_installed xsel; then
  copy_backend="xsel -i --clipboard"
elif [ -n "${DISPLAY-}" ] && is_app_installed xclip; then
  copy_backend="xclip -i -selection clipboard"
fi

echo "Found backend: ${copy_backend}"

while (true); do echo "Waiting..." ;  nc -w 10 -l 127.0.0.1 1988 | ${copy_backend}; done
