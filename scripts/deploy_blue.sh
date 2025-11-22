#!/bin/bash
set -e

IMAGE="axeldjesus/blue-green-app:latest"

echo "[BLUE] Haciendo pull de la imagen..."
docker pull "$IMAGE"

echo "[BLUE] Deteniendo contenedor anterior (si existe)..."
docker stop app-blue || true
docker rm app-blue || true

echo "[BLUE] Levantando nuevo contenedor en puerto 8081..."
docker run -d \
  --name app-blue \
  -p 8081:80 \
  "$IMAGE"

echo "[BLUE] Despliegue BLUE completado."
