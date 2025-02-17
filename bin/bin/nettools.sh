#!/bin/bash
# set -x

HOST_NETWORK=false
NAMESPACE=mobile-infra
NODE_NAME=""
DEPLOYMENT_NAME="test-deploy-${RANDOM}"
POD_NAME="test-${RANDOM}"
COMMAND=""
IMAGE="harbor.wildberries.ru/docker-hub-proxy/laki9/nettools:v0.0.1"  # Define the container image here

usage() {
    echo "Usage: $0 [-h] [-s <node>] [-n <namespace>] [-- <command>]"
    exit 1
}

# Parse arguments
while getopts "hn:s:" opt; do
    case $opt in
        h) HOST_NETWORK=true ;;
        s) NODE_NAME=$OPTARG ;;
        n) NAMESPACE=$OPTARG ;;
        *) usage ;;
    esac
done
shift $((OPTIND - 1))

# Capture additional arguments as the command (if any)
if [[ $# -gt 0 ]]; then
    COMMAND="$@"
fi

# Check if namespace exists before creating it
echo "Checking if namespace exists: kubectl get ns \"$NAMESPACE\""
if ! kubectl get ns "$NAMESPACE" &>/dev/null; then
    echo "Creating namespace: kubectl create ns \"$NAMESPACE\""
    kubectl create ns "$NAMESPACE"
else
    echo "Namespace '$NAMESPACE' already exists."
fi

# Run as a Deployment if a command is provided
if [[ -n "$COMMAND" ]]; then
    DEPLOYMENT_MANIFEST=$(cat <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: "$DEPLOYMENT_NAME"
  namespace: "$NAMESPACE"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: "$DEPLOYMENT_NAME"
  template:
    metadata:
      labels:
        app: "$DEPLOYMENT_NAME"
    spec:
      hostNetwork: $HOST_NETWORK
      dnsPolicy: ClusterFirstWithHostNet
      nodeName: "$NODE_NAME"
      containers:
        - name: nettools
          image: "$IMAGE"
          command: ["sh", "-c", "$COMMAND"]
          resources:
            requests:
              cpu: "100m"
              memory: "128Mi"
            limits:
              cpu: "500m"
              memory: "256Mi"
EOF
    )

    # Apply the deployment
    echo "$DEPLOYMENT_MANIFEST" | kubectl apply -f -

    # Wait for the pod to start
    kubectl -n "$NAMESPACE" rollout status deployment "$DEPLOYMENT_NAME"

    # Get logs from the running pod
    POD=$(kubectl get pods -n "$NAMESPACE" -l app="$DEPLOYMENT_NAME" -o jsonpath="{.items[0].metadata.name}")
    echo "Fetching logs from pod: $POD"
    kubectl logs -n "$NAMESPACE" -f "$POD"

    # Cleanup: Delete the deployment after execution
    echo "Deleting deployment: $DEPLOYMENT_NAME"
    kubectl delete deployment "$DEPLOYMENT_NAME" -n "$NAMESPACE"
else
    # Create the JSON patch for kubectl run --overrides
    OVERRIDES=$(jq -c . <<EOF
{
  "spec": {
    "hostNetwork": $HOST_NETWORK,
    "dnsPolicy": "ClusterFirstWithHostNet",
    "nodeName": "$NODE_NAME",
    "containers": [
      {
        "name": "nettools",
        "image": "$IMAGE",
        "resources": {
          "requests": {
            "cpu": "100m",
            "memory": "128Mi"
          },
          "limits": {
            "cpu": "500m",
            "memory": "256Mi"
          }
        }
      }
    ]
  }
}
EOF
)

    # Apply overrides and execute the command
    kubectl -n $NAMESPACE run $POD_NAME --image=$IMAGE --restart=Never -it --rm --image="$IMAGE" --overrides="$OVERRIDES"
fi
