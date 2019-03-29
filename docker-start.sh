#!/bin/sh

set -e
set -u

# ensure that volumes were set and the dependencies started before running the application
./scripts/wait-dir.sh ${NODE_CONFIG_DIR}

source ${NODE_CONFIG_DIR}/${NODE_ENV}
export $(cut -d= -f1 ${NODE_CONFIG_DIR}/${NODE_ENV})

source ${NODE_CONFIG_DIR}/secrets
export $(cut -d= -f1 ${NODE_CONFIG_DIR}/secrets)

./start.sh