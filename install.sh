#!/bin/bash
set -e
mkdir -p ~/bin
mkdir -p ~/.config/systemd/user
mkdir -p ~/.config/environment.d/

stow bash
stow bin
stow isort
stow systemd
stow lazygit
stow vim
stow systemd
stow environment.d
systemctl --user daemon-reload
systemctl --user enable gopls
systemctl --user start gopls

echo "PATH=$HOME/bin:$HOME/.local/bin/:$HOME/go/bin:$PATH" > ~/.config/environment.d/path.conf 
echo "HOME=$HOME" >> ~/.config/environment.d/path.conf
