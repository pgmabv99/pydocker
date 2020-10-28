#!/bin/bash
set -x
# kubectl apply -f azure-vote.yaml
kubectl delete services --all
kubectl delete deployments --all
kubectl delete pods --all

docker login -u pgmabv99 -p Lena8484
kubectl apply -f t1.yaml
# kubectl wait \
#   --for=condition=Ready deployment/azure-vote-front \
#   --timeout=100s
kubectl get services
kubectl get deployments
kubectl get pods -o wide  -l app=pydjango