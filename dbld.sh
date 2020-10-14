#!/bin/bash
set -x
source prf.sh
docker build . --tag $img
docker image ls