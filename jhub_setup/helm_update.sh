#!/bin/bash

CONFIG_FILE=$1

RELEASE=$(echo $CONFIG_FILE | grep -E -o "^config_[[:alnum:]]+\.yaml$" | sed -e "s/^config_//" -e "s/\.yaml$//")
NAMESPACE=$RELEASE

echo "NAMESPACE: $NAMESPACE"
echo "RELEASE: $RELEASE"

helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.8.0-beta.1 \
  --values $CONFIG_FILE

