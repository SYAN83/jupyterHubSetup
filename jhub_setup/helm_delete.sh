#!/bin/bash

RELEASE=$1
NAMESPACE=$RELEASE

echo "To be deleted:"
echo "NAMESPACE: $NAMESPACE"
echo "RELEASE: $RELEASE"

helm delete $RELEASE --purge
kubectl delete namespace $NAMESPACE
