#!/bin/bash
kubectl apply -f .
kubectl apply -f ./donotdisrupt
kubectl apply -f ./multicontainer
kubectl apply -f ./normal
kubectl apply -f ./outofmemory
kubectl apply -f ./private
kubectl apply -f ./secure