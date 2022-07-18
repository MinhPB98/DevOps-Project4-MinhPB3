#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t project-4-minhpb3:lastest
# Step 2: 
# List docker images
docker images
# Step 3: 
# Run flask app
docker run --name project4-udacity  -p 8080:80 project-4-minhpb3:lastest
