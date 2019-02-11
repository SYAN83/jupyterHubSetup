#!/bin/sh
echo "Enable dynamic storage"
kubectl apply -f storageclass.yml
echo "Enable encryption at rest"
kubectl delete storageclass gp2
kubectl apply -f storageclass_encrypted.yml
echo "Enable encryption in transit"
openssl rand -hex 128 > weave-passwd
kubectl create secret -n kube-system generic weave-passwd --from-file=./weave-passwd
kubectl patch \
  --namespace=kube-system daemonset/weave-net \
  --type json -p \
    '[ {
      "op": "add",
      "path": "/spec/template/spec/containers/0/env/0",
      "value": {
        "name": "WEAVE_PASSWORD",
        "valueFrom": {
          "secretKeyRef": {
            "key": "weave-passwd",
            "name": "weave-passwd"
          }
        }
      }
    } ]'

