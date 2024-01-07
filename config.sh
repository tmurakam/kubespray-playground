#!/bin/bash

if [ -e ./config.custom.sh ]; then
    source ./config.custom.sh
fi

# If you already prepared kubespray directory, set this
#KUBESPRAY_DIR=

# Otherwise set kubespray version
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.23.1}

# For vagrant
NODES=${NODES:-"192.168.56.61 192.168.56.62"}
USER=${USER:-vagrant}
PASSWORD=${PASSWORD:-vagrant}

