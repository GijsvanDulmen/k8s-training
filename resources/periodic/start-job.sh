#!/bin/bash
kubectl -n apps delete job parallel-job --ignore-not-found
kubectl apply -f ./job.yml