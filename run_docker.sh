#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t machine-learning-ms:1.0 .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
#docker run -it --name machine-learning-ms-api -p 8000:80 machine-learning-ms:1.0 bash
docker run --detach --name machine-learning-ms-api -p 8000:80 machine-learning-ms:1.0
