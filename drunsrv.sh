#!/bin/bash
set -x
source prf.sh
docker rm  srv
docker run --name=srv  \
-p 8000:8000 \
-p 8022:22 \
$img \
/bin/bash pdjrun.sh

