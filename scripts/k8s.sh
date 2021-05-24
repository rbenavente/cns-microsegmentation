#!/bin/bash

# Connecting to the K8s cluster
gcloud container clusters get-credentials microsegmentation-gke --region us-east1 --project "project name"

# Configuring the namespaces
kubectl create namespace sock-shop && \
kubectl create namespace boutique && \
#kubectl create namespace rogue && \
#kubectl create namespace victim && \

# Deploying the applications
kubectl config set-context --current --namespace=sock-shop && \
kubectl apply -f /tmp/sock-shop.yaml && \
kubectl config set-context --current --namespace=boutique && \
kubectl apply -f /tmp/boutique.yaml && \
#kubectl config set-context --current --namespace=rogue && \
#kubectl apply -f /tmp/rogue.yaml && \
#kubectl config set-context --current --namespace=victim && \
#kubectl apply -f /tmp/victim.yaml
