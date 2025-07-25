#!/bin/bash

echo -e "\n Removing manifests..."
kubectl delete -f ../manifests/

echo -e "\n Removing ingress-nginx (Helm)..."
helm uninstall nginx -n ingress-nginx

echo -e "\n Deleting namespace ingress-nginx..."
kubectl delete namespace ingress-nginx

echo -e "\n Deleting cluster on K3D..."
k3d cluster delete observability

