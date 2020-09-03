#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=youngphillip/devops-project

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment devops-project --image=$dockerpath:latest

# Step 3:
# List kubernetes pods
kubectl get pods


echo "Waiting 5 seconds for pods to spin up..."
sleep 5s

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/devops-project 8000:80
