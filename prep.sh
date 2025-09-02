#!/bin/bash
source config.sh
CURDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pip install -r requirements.txt

KUBESPRAY_DIR=${KUBESPRAY_DIR:-./kubespray-${KUBESPRAY_VERSION}}

if [ ! -e $KUBESPRAY_DIR ]; then
    echo "==> Get kubespray"
    ./get-kubespray.sh || exit 1
else
    echo "==> A $KUBESPRAY_DIR already exists, skip getting kubespray"
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
    echo "==> Create inventory/mycluster"
    cp -rfp inventory/sample inventory/mycluster
else
    echo "==> A inventory/mycluster directory exists, skip creation."
fi

# Update Ansible inventory file with inventory builder
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 ${CURDIR}/inventory_builder/inventory.py $NODES

cat inventory/mycluster/hosts.yaml

# Setup proxy config
if [ -n "$http_proxy" ]; then
    cat <<EOF >inventory/mycluster/group_vars/all/proxy.yml
---
http_proxy: $http_proxy
https_proxy: $https_proxy
additional_no_proxy: $no_proxy
EOF
fi
