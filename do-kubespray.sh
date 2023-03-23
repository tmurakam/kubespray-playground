#!/bin/bash
source config.sh
KUBESPRAY_DIR=./kubespray-${KUBESPRAY_VERSION}

if [ ! -e $KUBESPRAY_DIR ]; then
    echo "No kubespray dir"
    exit 1
fi
cd $KUBESPRAY_DIR

# Activate venv
if [ ! -e ~/.venv/default/bin/activate ]; then
    echo "No venv dir"
    exit 1
fi
source ~/.venv/default/bin/activate

# Run kubespray
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml
