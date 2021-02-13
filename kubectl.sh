#!/bin/bash

# show per namespace
kubectl get pods -n apps

# show supported api resources
kubectl api-resources --namespaced=true
kubectl api-resources --namespaced=false

# show (not!) all stuff for a label
# but does show the "regular" resources
kubectl get all --all-namespaces -l app=disrupt 

# show all if you ever need to
for i in `kubectl api-resources | awk '{print $1}'` do ; kubectl get --all-namespaces -l app=disrupt $i

# show pods not running
kubectl get pods --all-namespaces --field-selector status.phase=running

# use output json path
# https://kubernetes.io/docs/reference/kubectl/jsonpath/
kubectl get pods --all-namespaces -o=jsonpath='{.items[0].metadata.name}'

# name and status
kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}'

# other outputs
# use jq and yq to pretty print
kubectl get pods --all-namespaces -o json | jq
kubectl get pods --all-namespaces -o yaml | yq -C e
kubectl get pods --all-namespaces -o name
kubectl get pods --all-namespaces -o wide
