#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
mydockerpath="976245815270.dkr.ecr.us-east-1.amazonaws.com/project-4-minhpb3"
AWS_ACCOUNT="976245815270"
AWS_REGION="us-east-1"
# Step 2
# Run the Docker Hub container with kubernetes
# 1 create secret to connect to private image registry
kubectl create secret docker-registry awscreds \
  --docker-server=https://976245815270.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1 )

kubectl apply -f deployment.yaml

# Step 3:
# List kubernetes pods
kubectl get pods -A

# Step 4:
# Forward the container port to a host
kubectl apply -f service.yaml
