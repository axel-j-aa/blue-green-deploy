#!/bin/bash
set -e

echo "GREEN" > app/current_version.txt

IMAGE="axeldjesus/blue-green-app:latest"

docker build -t $IMAGE .
docker push $IMAGE

docker stop app-green || true
docker rm app-green || true

docker run -d \
    --name app-green \
    -p 8082:80 \
    $IMAGE
