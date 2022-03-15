#!/bin/bash

echo "---------------------------------------------------"
echo "       Deploying the App of ApplicationSet"
echo "---------------------------------------------------"

oc apply -f ./bootstrap/argocd/gitopsbootstrapper-a.yaml

echo "---------------------------------------------------"
echo "             Your ArgoCD WebUI URL"
echo "---------------------------------------------------"

oc get route -l  app.kubernetes.io/name=openshift-gitops-server -n openshift-gitops -o 'jsonpath={..spec.host}'
echo ""

echo "---------------------------------------------------"
echo "           Your ArgoCD Admin Password"
echo "---------------------------------------------------"

oc extract secret/openshift-gitops-cluster --to=- -n openshift-gitops
