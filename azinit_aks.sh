#!/bin/bash
set -x

# azure AKS cluster operations 
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux
# az login
# az aks install-cli
# kubectl get nodes ]??

# 1. create cluster
# az aks create   --name pgmabv88 --resource-group pgmabv88 \
--ssh-key-value /home/azureuser/.ssh/authorized_keys \
--node-count 1

# 2. copy credential to local file
# az aks get-credentials --resource-group pgmabv88 --name pgmabv88


# 3. create external ip 
# ip to be added to yaml
# az network public-ip create \
    --resource-group pgmabv88 \
    --name aks-ip \
    --sku Standard \
    --allocation-method static

# 4. add role to allow aks cluster to have external ip
## assignee taken from clientid of aks cluster
## subsription and aks resource group 
# az role assignment create \
    --assignee 7babc88d-e262-43ac-934d-59197e1bb7bd \
    --role "Network Contributor" \
    --scope /subscriptions/cbff8ae6-7d79-4b2d-bf97-d9fc382bc181/resourceGroups/pgmabv88

#utils 
# az aks stop --name pgmabv88 --resource-group pgmabv88
# az aks delete --name pgmabv88 --resource-group pgmabv88
# =========show service principal
#az aks show --name pgmabv88 --resource-group pgmabv88 --query servicePrincipalProfile.clientId -o tsv

