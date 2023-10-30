systemctl --user daemon-reload
killall -9 ssh
systemctl --user restart sga-guard-devvm3
systemctl --user restart ssh-clipboard-devvm3 
