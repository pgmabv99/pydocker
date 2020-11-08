#!/bin/bash
set -x
group=pgmabv88
name=pgmabv88
db=db88
region=eastus2
az sql server delete            -g $group -n $name -y
echo "sleep 30"
sleep 30
az sql server create -l $region -g $group -n $name -u srvadmin -p Mark8484 -e true
az sql server list

az sql db create -g $group -s $name -n $db
az sql db list -s $name -g $group

az sql server firewall-rule delete -g $group   -s $name 
az sql server firewall-rule create -g $group -s $name  -n $name \
              --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0

# az sql server firewall-rule list --resource-group pgmabv88 -server pgmabv01
# az sql server firewall-rule list -g pgmabv88 -s pgmabv88