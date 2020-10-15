#!/bin/bash
set -x
source prf.sh
docker rm $cnt
docker run --name=$cnt  \
-it \
-p 8000:8000 \
-p 8022:22 \
$img \
/bin/bash 