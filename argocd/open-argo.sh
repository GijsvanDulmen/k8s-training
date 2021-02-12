#!/bin/bash
kubectl port-forward -n argocd deployment/argocd-server 8080 &
Open "https://localhost:8080/"