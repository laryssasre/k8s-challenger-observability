#!/bin/bash

set -e

echo -e "\n Creating cluster on k3d..."
k3d cluster create observability --agents 2 --port "3000:80@loadbalancer"

echo -e "\n Building ingress-nginx with Helm..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

echo -e "\n Waiting for nginx-ingress to be available..."
kubectl wait --namespace ingress-nginx \
  --for=condition=Available deployment/nginx-ingress-nginx-controller \
  --timeout=50s

echo -e "\n Applying manifests..."
kubectl apply -f ../manifests/
