#!/bin/bash
kubectl get pods -A | grep Terminating | awk '{system("kubectl -n " $1 " delete pod " $2 " --grace-period=0 --force")}'
