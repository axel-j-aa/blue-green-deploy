#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[BLUE] Pulling..."
docker pull "$IMAGE"

echo "[BLUE] Stopping old..."
docker stop app-blue || true
docker rm app-blue || true

echo "[BLUE] Creating BLUE container..."
docker run -d \
  --name app-blue \
  -p 8081:80 \
  "$IMAGE"

echo "[BLUE] Writing BLUE version..."
docker exec app-blue sh -c "echo BLUE > /usr/share/nginx/html/current_version.txt"

echo "[BLUE] Done."
