#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[GREEN] Haciendo pull de la imagen..."
docker pull "$IMAGE"

echo "[GREEN] Deteniendo contenedor anterior (si existe)..."
docker stop app-green || true
docker rm app-green || true

echo "[GREEN] Levantando nuevo contenedor en puerto 8082..."
docker run -d \
  --name app-green \
  -p 8082:80 \
  "$IMAGE"

echo "[GREEN] Despliegue GREEN completado."
