#!/bin/bash
set -x
# az login
# az aks install-cli
# kubectl get nodes

# az aks stop --name pgmabv99 --resource-group pgmabv99
# =========show service principal
#az aks show --name pgmabv99 --resource-group pgmabv99 --query servicePrincipalProfile.clientId -o tsv

# 1. create cluster
# az aks create   --name pgmabv99 --resource-group pgmabv99 \
--ssh-key-value /home/azureuser/.ssh/authorized_keys \
--node-count 1
# 2. copy credential to local file
# az aks get-credentials --resource-group pgmabv99 --name pgmabv99

# 3. add role to allow aks cluster to have external ip
# az role assignment create \
    --assignee 635d4eec-ce76-48d8-9cc9-082ceda78269 \
    --role "Network Contributor" \
    --scope /subscriptions/4b43675f-1b10-4d6a-8e6b-acfa756ef732/resourceGroups/MC_pgmabv99_pgmabv99_westus

# 4. create external ip 
#az network etc

