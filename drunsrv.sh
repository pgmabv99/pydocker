#!/bin/bash
set -x
source prf.sh
docker rm test
docker run --name=test  \
-p 52022:22 \
python  