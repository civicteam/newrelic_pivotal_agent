#!/bin/sh

set -e
set -u

# ensure that volumes were set and the dependencies started before running the application
echo "Verifying if config directory exists"
./wait-dir.sh ${NODE_CONFIG_DIR}

export $(cut -d= -f1,2 ${NODE_CONFIG_DIR}/${NODE_ENV})

export $(cut -d= -f1,2 ${NODE_CONFIG_DIR}/secrets)

# echo "Starting RabbitMQ Monitoring"
./start.sh 