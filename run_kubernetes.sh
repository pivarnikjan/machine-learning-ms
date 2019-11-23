#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

source ./.env
source ./.password.cfg

# Step 1:
# This is your Docker ID/path
dockerpath="${docker_user}/${DOCKER_NAME}:${DOCKER_TAG}"

# Step 2
# Run the Docker Hub container with kubernetes
running_pod=$(kubectl get pods | grep ${DOCKER_NAME} | awk '{print $1}' 2>&1)

if [[ "${running_pod}" != "${DOCKER_NAME}" ]]; then
    kubectl run ${DOCKER_NAME} --image=${dockerpath} --generator=run-pod/v1
else
    echo "Pod: ${DOCKER_NAME} is already running. Please terminate with command: kubectl delete pod ${DOCKER_NAME}"
fi


# Step 3:
# List kubernetes pods
sleep 2
kubectl get pods

# Step 4:
# Forward the container port to a host
sleep 2
kubectl port-forward ${DOCKER_NAME} 8000:80
