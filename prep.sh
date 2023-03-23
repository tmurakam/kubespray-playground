#!/bin/bash
source config.sh
KUBESPRAY_DIR=./kubespray-${KUBESPRAY_VERSION}

if [ ! -e $KUBESPRAY_DIR ]; then
    ./get-kubespray.sh || exit 1
fi
cd $KUBESPRAY_DIR

sudo apt update
sudo apt install sshpass

# Create ssh key
if [ ! -e ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -N ""
fi

# Copy public key to all nodes
for node in $NODES; do
    sshpass -pvagrant ssh-copy-id -oStrictHostKeyChecking=no vagrant@$node
done

# Activate venv
if [ ! -e ~/.venv/default/bin/activate ]; then
    sudo apt install -y python3-venv

    python3 -m venv ~/.venv/default
fi
source ~/.venv/default/bin/activate

# Install ansible
pip install -r requirements.txt || exit 1

# create inventory dir
if [ ! -d inventory/mycluster ]; then
    cp -rfp inventory/sample inventory/mycluster
fi

# Update Ansible inventory file with inventory builder
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py $NODES

cat inventory/mycluster/hosts.yaml
