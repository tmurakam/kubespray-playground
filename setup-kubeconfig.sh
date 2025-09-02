#!/bin/bash

ssh vagrant@192.168.56.61 "mkdir ~/.kube && sudo cat /etc/kubernetes/admin.conf > ~/.kube/config"
