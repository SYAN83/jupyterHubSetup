#!/bin/bash

# grant admin privileges

if [[ $(kubectl get serviceAccounts -n kube-system | grep 'kubernetes-dashboard') ]]; then
    echo 'Dashboard user is available.'
else
    echo 'Create admin for Dashboard'
    kubectl create -f dashboard-admin.yaml
fi

if [[ $(kubectl get svc -n kube-system | grep 'kubernetes-dashboard') ]]; then
    echo "Dashboard is already deployed."
else
    echo "Deploy Dashboard"
    kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
fi

echo "Dashboard Access Token:"
kubectl -n kube-system describe secrets $(kubectl -n kube-system get secret | grep kubernetes-dashboard-token- | awk '{print $1;}')
echo
echo "Run CMD 'kubectl proxy' and then cuick the link below to access Dashboard"
echo
echo "http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
