#!/bin/bash
set -x
kubectl logs -l app=pydjango 
kubectl get pods  -l app=pydjango  -o wide
kubectl get services   -o wide
kubectl get deployments  -o wide
