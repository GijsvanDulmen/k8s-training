#!/bin/bash

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Set fixed password
# Username: admin
# Password: admin
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$k.6AIfusiYu8z3BMKYcfLuolH/IeiHESZxCjC68TbPk254gYodAgm",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'