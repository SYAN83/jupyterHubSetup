#!/bin/sh

#CONFIG_FILE=$1
RELEASE=jhub

helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.7.0 \
  --values config_updated.yaml

