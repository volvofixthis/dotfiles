#!/bin/bash
HOST_NETWORK=false
NAMESPACE=nettools
usage() {
    echo "Usage: $0 [-h] [-s <node>] [-n <namespace>]"
    exit 1
}

# Parse arguments
while getopts "hn:" opt; do
    case $opt in
        h) HOST_NETWORK=true ;;
        s) NODE_NAME=$OPTARG ;;
        s) NAMESPACE=$OPTARG ;;
        *) usage ;;
    esac
done

kubectl create ns $NAMESPACE 2>&1 >/dev/null || echo "namespace already exists"
kubectl -n $NAMESPACE run --restart=Never --rm test-${RANDOM} -it --image=jrecord/nettools --overrides='{"kind":"Pod", "apiVersion":"v1", "spec": {"hostNetwork":
'${HOST_NETWORK}', "dnsPolicy": "ClusterFirstWithHostNet", "nodeName": "'$NODE_NAME'"}}'
