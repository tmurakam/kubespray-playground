#!/bin/bash

if [ -e ./config.custom.sh ]; then
    source ./config.custom.sh
fi

# If you already prepared kubespray directory, set this
#KUBESPRAY_DIR=./kubespray

# Otherwise set kubespray version
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.29.0}
#KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-"master"}

# If you use multi node (3 nodes) configuration, set this to 'true'
MULTI_NODE=${MULTI_NODE:-false}

# For vagrant
if [ "$MULTI_NODE" = "true" ]; then
    NODES="192.168.56.61 192.168.56.62 192.168.56.63"
else
    NODES="192.168.56.61"
fi

SSH_USER=${SSH_USER:-vagrant}
SSH_PASSWORD=${SSH_PASSWORD:-vagrant}

