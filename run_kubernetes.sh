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
  --docker-server=${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password \                     
    --region us-east-1 \
| docker login \
    --username AWS \
    --password-stdin 976245815270.dkr.ecr.us-east-1.amazonaws.com) \

kubectl apply -f deployment.yaml
kubectl expose deployment project-4-udacity --port=80 --name=service-project-4-udacity

# Step 3:
# List kubernetes pods
kubectl get pods -A

# Step 4:
# Forward the container port to a host
kubectl expose deployment project-4-udacity --type=LoadBalancer --port=8080 --target-port=80
