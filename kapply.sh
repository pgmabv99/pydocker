#!/bin/bash
set -x
kubectl delete services --all
kubectl delete deployments --all
kubectl delete pods --all

docker login -u pgmabv99 -p Lena8484

kubectl apply -f pydjango.yaml
kubectl get services
kubectl get deployments
kubectl get pods -o wide  -l app=pydjango