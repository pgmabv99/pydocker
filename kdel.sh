#!/bin/bash
set -x
kubectl delete deployments --all
kubectl delete services --all
# kubectl delete service azure-vote-back
# kubectl delete service azure-vote-front