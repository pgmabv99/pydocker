#!/bin/bash
set -x
source prf.sh
docker rm $cnt
docker run --name=$cnt  \
-it \
$img \
/bin/bash