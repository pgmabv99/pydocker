#!/bin/bash
set -x
docker run -dt -P --name "pydjango-dev" \
   --label "com.microsoft.created-by=visual-studio-code" \
   -v "/home/azureuser/.vscode-server/extensions/ms-python.python-2020.9.114305/pythonFiles/lib/python/debugpy:/debugpy:ro" \
   --entrypoint "python"  \
   "pydjango:latest"