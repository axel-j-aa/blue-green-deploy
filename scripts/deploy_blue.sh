#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

docker pull "$IMAGE"

docker stop app-blue || true
docker rm app-blue || true

docker run -d \
  --name app-blue \
  -p 8081:80 \
  -e VERSION=BLUE \
  "$IMAGE"
