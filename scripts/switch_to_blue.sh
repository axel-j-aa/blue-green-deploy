#!/bin/bash
set -e

echo "[Nginx] Cambiando tráfico a BLUE (8081)..."
sudo ln -sf /etc/nginx/sites-available/blue.conf /etc/nginx/sites-enabled/app.conf
sudo nginx -t
sudo systemctl reload nginx
echo "[Nginx] Ahora BLUE está sirviendo tráfico."
