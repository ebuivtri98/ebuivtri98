#!/bin/bash

# Set the image name and tag
IMAGE_NAME="my-python-web-app"
TAG="latest"

# Build the Docker image
docker build -t "${IMAGE_NAME}:${TAG}" .

# Run the Docker container
docker run -p 8080:8080 "${IMAGE_NAME}:${TAG}"
