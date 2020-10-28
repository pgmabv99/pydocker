#!/bin/bash
set -x
az role assignment create \
    --assignee 912a58f5-eb78-42ca-ae5e-73f391649040 \
    --role "Network Contributor" \
    --scope /subscriptions/4b43675f-1b10-4d6a-8e6b-acfa756ef732/resourceGroups/MC_pgmabv99_pgmabv99_westus
