#!/bin/bash
set -x
source prf.sh
docker  rm -f $(docker ps -a -q)
