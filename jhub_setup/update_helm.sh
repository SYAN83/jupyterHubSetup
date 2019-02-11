#!/bin/sh

#CONFIG_FILE=$1
RELEASE=jhub

helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.8.0-beta.1 \
  --values config_updated.yaml

