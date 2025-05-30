#!/bin/bash
source config.sh
CURDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pip install -r requirements.txt

KUBESPRAY_DIR=${KUBESPRAY_DIR:-./kubespray-${KUBESPRAY_VERSION}}

if [ ! -e $KUBESPRAY_DIR ]; then
    ./get-kubespray.sh || exit 1
fi
cd $KUBESPRAY_DIR

# Copy public key to all nodes
for node in $NODES; do
    ssh-keygen -R $node
    #sshpass -p$SSH_PASSWORD ssh-copy-id -oStrictHostKeyChecking=no -o "IdentifyFile=~/.vagrant.d/insecure_private_key" $SSH_USER@$node
    ssh-copy-id -oStrictHostKeyChecking=no -o "IdentityFile=~/.vagrant.d/insecure_private_key" -f $SSH_USER@$node || exit 1
done

# Install ansible
pip install -r requirements.txt || exit 1

# create inventory dir
if [ ! -d inventory/mycluster ]; then
    cp -rfp inventory/sample inventory/mycluster
fi

# Update Ansible inventory file with inventory builder
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 ${CURDIR}/inventory_builder/inventory.py $NODES

cat inventory/mycluster/hosts.yaml
