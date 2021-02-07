#!/bin/bash

set -e exit

OS="$(uname)"
case $OS in
  Darwin)
    # Docker driver needed for networking to work
    DRIVER="docker"
    ;;
  linux)
    # UNTESTED!
    DRIVER="hyperkit"
    ;;
  MINGW64* )
    # UNTESTED!
    DRIVER="hyperv"
    ;;
  *)
    echo "Your ${OS} is not supported."
    exit 1
    ;;
esac

minikube -p k8s-training start \
    --memory=5120 --cpus=4 --vm=true \
    --feature-gates=EphemeralContainers=true \
    --network-plugin=cni --cni calico \
    --nodes 2 \
    --driver=${DRIVER}

# add a worker
minikube -p k8s-training addons enable metrics-server
minikube -p k8s-training addons enable dashboard