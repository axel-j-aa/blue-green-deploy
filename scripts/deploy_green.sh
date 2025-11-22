#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[GREEN] Pulling image..."
docker pull "$IMAGE"

echo "[GREEN] Stopping previous container..."
docker stop app-green || true
docker rm app-green || true

echo "[GREEN] Starting GREEN container..."
docker run -d \
  --name app-green \
  -p 8082:80 \
  "$IMAGE"

echo "[GREEN] Writing version file..."
docker exec app-green sh -c "echo GREEN > /usr/share/nginx/html/current_version.txt"

echo "[GREEN] DONE."
