#!/bin/bash

if [ -e ./config.custom.sh ]; then
    source ./config.custom.sh
fi

# If you already prepared kubespray directory, set this
#KUBESPRAY_DIR=./kubespray

# Otherwise set kubespray version
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.23.1}

# For vagrant
NODES=${NODES:-"192.168.56.61 192.168.56.62"}
SSH_USER=${SSH_USER:-vagrant}
SSH_PASSWORD=${SSH_PASSWORD:-vagrant}

