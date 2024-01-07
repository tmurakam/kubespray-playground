#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
source config.sh

KUBESPRAY_TARBALL=kubespray-${KUBESPRAY_VERSION}.tar.gz

KUBESPRAY_DIR=${KUBESPRAY_DIR:-./kubespray-${KUBESPRAY_VERSION}}

remove_kubespray_cache_dir() {
    if [ -e ${KUBESPRAY_DIR} ]; then
        /bin/rm -rf ${KUBESPRAY_DIR}
    fi
}

if [ -e ${KUBESPRAY_DIR} ]; then
    echo "${KUBESPRAY_DIR} already exists, exit"
    exit 0
fi

if [ ! -e cache/${KUBESPRAY_TARBALL} ]; then
    echo "===> Download ${KUBESPRAY_TARBALL}"
    curl -SL https://github.com/kubernetes-sigs/kubespray/archive/refs/tags/v${KUBESPRAY_VERSION}.tar.gz >cache/${KUBESPRAY_TARBALL} || exit 1

    #remove_kubespray_cache_dir
fi

echo "===> Extract ${KUBESPRAY_TARBALL}"
tar xzf cache/${KUBESPRAY_TARBALL}

echo "Done."
