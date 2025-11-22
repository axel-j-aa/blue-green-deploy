#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[BLUE] Haciendo pull de la imagen..."
docker pull "$IMAGE"

echo "[BLUE] Deteniendo contenedor anterior..."
docker stop app-blue || true
docker rm app-blue || true

echo "[BLUE] Levantando contenedor BLUE..."
docker run -d \
  --name app-blue \
  -p 8081:80 \
  -e VERSION=BLUE \
  "$IMAGE"

echo "[BLUE] Listo."
