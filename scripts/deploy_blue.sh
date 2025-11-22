#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[BLUE] Pulling image..."
docker pull "$IMAGE"

echo "[BLUE] Stopping previous container..."
docker stop app-blue || true
docker rm app-blue || true

echo "[BLUE] Starting BLUE container..."
docker run -d \
  --name app-blue \
  -p 8081:80 \
  -e VERSION=BLUE \
  "$IMAGE"

echo "[BLUE] DONE."
