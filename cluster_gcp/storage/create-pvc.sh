#!/bin/bash

NAME='gke-nycdsa-cloudlab-data-disk'

# gcloud compute disks list | grep $NAME
if [[ $(gcloud compute disks list | grep $NAME) ]]; then
  echo 'Use existing disk for persistentVolume.'
else
  echo 'Creating disk for persistentVolume.'
  gcloud compute disks create --size=32GB --zone us-east1-b $NAME
fi

kubectl apply -f create-pvc.yaml
