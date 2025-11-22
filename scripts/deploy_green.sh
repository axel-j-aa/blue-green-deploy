#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[GREEN] Haciendo pull de la imagen..."
docker pull "$IMAGE"

echo "[GREEN] Deteniendo contenedor anterior..."
docker stop app-green || true
docker rm app-green || true

echo "[GREEN] Levantando contenedor GREEN..."
docker run -d \
  --name app-green \
  -p 8082:80 \
  "$IMAGE"

echo "[GREEN] Escribiendo versión GREEN..."
docker exec app-green sh -c "echo GREEN > /usr/share/nginx/html/current_version.txt"

echo "[GREEN] Listo."
