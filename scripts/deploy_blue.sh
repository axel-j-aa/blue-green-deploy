#!/bin/bash
set -e

echo "BLUE" > app/current_version.txt

IMAGE="axeldjesus/blue-green-app:latest"

docker build -t $IMAGE .
docker push $IMAGE

docker stop app-blue || true
docker rm app-blue || true

docker run -d \
    --name app-blue \
    -p 8081:80 \
    $IMAGE
