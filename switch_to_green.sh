#!/bin/bash
set -e

echo "[Nginx] Cambiando tráfico a GREEN (8082)..."
sudo ln -sf /etc/nginx/sites-available/green.conf /etc/nginx/sites-enabled/app.conf
sudo nginx -t
sudo systemctl reload nginx
echo "[Nginx] Ahora GREEN está sirviendo tráfico."
