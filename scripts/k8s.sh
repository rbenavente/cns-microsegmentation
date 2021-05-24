#!/bin/bash

# Connecting to the K8s cluster


# Configuring the namespaces
kubectl create namespace sock-shop && \
kubectl create namespace boutique && \
kubectl create namespace rogue && \
kubectl create namespace victim && \

# Deploying the applications
kubectl apply -f /tmp/sock-shop.yaml && \
kubectl apply -f /tmp/boutique.yaml && \
kubectl apply -f /tmp/rogue.yaml && \
kubectl apply -f /tmp/victim.yaml
