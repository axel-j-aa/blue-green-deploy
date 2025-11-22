#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

docker pull "$IMAGE"

docker stop app-green || true
docker rm app-green || true

docker run -d \
  --name app-green \
  -p 8082:80 \
  -e VERSION=GREEN \
  "$IMAGE"
