#!/bin/bash
set -x
source prf.sh
docker build . --tag $img
docker image ls
docker login -u pgmabv99 -p Lena8484
docker push  $img
