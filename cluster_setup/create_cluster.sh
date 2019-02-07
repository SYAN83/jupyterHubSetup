#!/bin/sh
kops create cluster $NAME \
  --zones $ZONES \
  --authorization RBAC \
  --master-size t3.micro \
  --master-volume-size 10 \
  --node-size t3.medium \
  --node-volume-size 10 \
  --networking weave \
  --topology private
