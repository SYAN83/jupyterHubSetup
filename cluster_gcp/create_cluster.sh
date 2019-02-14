#!/bin/bash

gcloud container clusters create \
  --machine-type n1-standard-4 \
  --num-nodes 1 \
  --enable-autoscaling \
  --min-nodes 0 \
  --max-nodes 3 \
  --zone us-east1-b \
  --cluster-version latest \
  nycdsa-cloudlab

kubectl get node

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=shu.yan@nycdatascience.com
