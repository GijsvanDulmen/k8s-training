#!/bin/bash

set -e exit

OS="$(uname)"
case $OS in
  Darwin)
    DRIVER="hyperkit"
    ;;
  linux)
    DRIVER="hyperkit"
    ;;
  MINGW64* )
    DRIVER="hyperv"
    ;;
  *)
    echo "Your ${OS} is not supported."
    exit 1
    ;;
esac

minikube -p k8s-training start \
    --memory=8192 --cpus=4 --vm=true \
    --feature-gates=EphemeralContainers=true \
    --cni calico \
    --driver=${DRIVER}

# add a worker
minikube -p k8s-training node add --worker
minikube -p k8s-training addons enable metrics-server
minikube -p k8s-training addons enable dashboard