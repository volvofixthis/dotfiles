#!/bin/bash
ports=(9001 80 443 2501 7771 30001 27015 3306 3005 8080)

# Get the length of the array
array_length=${#ports[@]}

timestamp=$(date +%s)

# Generate a random index
# index=$((RANDOM % array_length))
index=$(( timestamp % $array_length ))
echo $index

# Get the random value from the array
port=${ports[index]}
~/go/bin/go-shadowsocks2 -c "${SHADOWSOCKS_ENDPOINT}:${port}/?outline=1" -verbose  -socks 0.0.0.0:1080
