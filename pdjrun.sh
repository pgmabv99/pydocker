#!/bin/bash
set -x
sudo service ssh start
python -u manage.py runserver  --noreload 0.0.0.0:8000