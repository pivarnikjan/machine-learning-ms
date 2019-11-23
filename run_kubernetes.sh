#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

source ./.env
source ./.password.cfg

# Step 1:
# This is your Docker ID/path
dockerpath="${docker_user}/${DOCKER_NAME}:${DOCKER_TAG}"

# Step 2
# Run the Docker Hub container with kubernetes


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host

