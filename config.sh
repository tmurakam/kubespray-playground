#!/bin/bash

if [ -e ./config.custom.sh ]; then
    source ./config.custom.sh
fi
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.22.0}

NODES=${NODES:-"192.168.56.61 192.168.56.62"}
USER=${USER:-vagrant}
PASSWORD=${PASSWORD:-vagrant}

