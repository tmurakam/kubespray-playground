#!/bin/bash
source config.sh
KUBESPRAY_DIR=./kubespray-${KUBESPRAY_VERSION}

if [ ! -e $KUBESPRAY_DIR ]; then
    echo "No kubespray dir"
    exit 1
fi
cd $KUBESPRAY_DIR

# Run kubespray
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root -u $USER cluster.yml $*
