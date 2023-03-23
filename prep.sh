#!/bin/bash
source config.sh
KUBESPRAY_DIR=./kubespray-${KUBESPRAY_VERSION}

if [ ! -e $KUBESPRAY_DIR ]; then
    ./get-kubespray.sh || exit 1
fi
cd $KUBESPRAY_DIR

# Activate venv
if [ ! -e ~/.venv/default/bin/activate ]; then
    sudo apt update
    sudo apt install -y python3-venv

    python3 -m venv ~/.venv/default
fi
source ~/.venv/default/bin/activate

# Install ansible
pip install -r requirements.txt || exit 1

    

