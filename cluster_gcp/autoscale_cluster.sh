#!/bin/sh

gcloud beta container node-pools create user-pool \
  --cluster nycdsa-cloudlab \
  --preemptible \
  --machine-type n1-standard-2 \
  --num-nodes 0 \
  --enable-autoscaling \
  --min-nodes 0 \
  --max-nodes 3 \
  --zone us-east1-b \
  --node-labels hub.jupyter.org/node-purpose=user \
  --node-taints hub.jupyter.org_dedicated=user:NoSchedule

