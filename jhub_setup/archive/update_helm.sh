#!/bin/bash

RELEASE=jhub

helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.8.0-beta.1 \
  --values config.yaml

