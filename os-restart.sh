#!/bin/bash -e

echo "[INFO] Killing OpenShift..."
sudo pkill openshift

echo "[INFO] Starting OpenShift..."
loglevel=${1:-0}
sudo /data/src/github.com/openshift/origin/_output/local/bin/linux/amd64/openshift start \
  --master-config=$HOME/openshift.local.config/master/master-config.yaml \
  --node-config=$HOME/openshift.local.config/node-dev/node-config.yaml \
  --loglevel=$loglevel &>> $HOME/logs/openshift.log &
sleep 5
