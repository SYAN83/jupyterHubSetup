#!/bin/sh

RELEASE=jhub

helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.7.0 \
  --values config_updated.yaml

