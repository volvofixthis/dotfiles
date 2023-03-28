kubectl -n $1 get events --sort-by='.metadata.creationTimestamp'
