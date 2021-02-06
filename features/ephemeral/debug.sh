#!/bin/bash
export POD=`kubectl get pod -n apps -l app=disrupt -o jsonpath='{.items[0].metadata.name}'`
kubectl alpha debug -n apps -it ${POD} --image=busybox:latest --target=disrupt