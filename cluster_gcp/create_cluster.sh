#!/bin/sh

gcloud container clusters create \
  --machine-type n1-standard-2 \
  --num-nodes 2 \
  --zone us-east1-b \
  --cluster-version latest \
  nycdsa-cloudlab

kubectl get node

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=shu.yan@nycdatascience.com
