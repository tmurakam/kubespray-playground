#!/bin/bash

if [ -e ./config.custom.sh ]; then
    source ./config.custom.sh
fi

# If you already prepared kubespray directory, set this
#KUBESPRAY_DIR=./kubespray

# Otherwise set kubespray version
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.27.0}
#KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-"master"}

# For vagrant
NODES=${NODES:-"192.168.56.61"}  # control only
#NODES=${NODES:-"192.168.56.61 192.168.56.62"}   # control + worker
SSH_USER=${SSH_USER:-vagrant}
SSH_PASSWORD=${SSH_PASSWORD:-vagrant}

