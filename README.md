Proyecto Blue-Green Deployment con Docker, Nginx, Supertest y CI/CD
# 🚀 Blue-Green Deployment – CI/CD + Docker + Nginx + API Tests

Este repositorio implementa una arquitectura completa de despliegue **Blue-Green**, la cual permite publicar nuevas versiones sin tiempo de inactividad (zero-downtime).  
Incluye:

- Docker (App + Nginx)
- GitHub Actions CI/CD automatizado
- Reverse Proxy Nginx para alternar tráfico entre Blue y Green
- API Node.js sin base de datos
- Pruebas de integración con Supertest + Jest
- Scripts automáticos de despliegue en VPS

---

# 📥 1. Clonar el repositorio

```bash
git clone https://github.com/axel-j-aa/blue-green-deploy.git
cd blue-green-deploy
```



# ⚙️ 2. Instalar dependencias del API (solo para pruebas locales)
```bash
cd api
npm install
```

#🧪 3. Ejecutar pruebas (Supertest + Jest)
```bash
npm test
```

## Salida esperada:

```bash
PASS tests/root.test.js
PASS tests/health.test.js
PASS tests/version.test.js
Tests: 3 passed
```


# 🐳 4. Levantar el proyecto con Docker

Desde la raíz del repositorio:

1. Construir la imagen:
```bash
docker build -t blue-green-local .
```
3. Ejecutar el contenedor:
```bash
docker run -p 80:80 blue-green-local
```

Luego abre en tu navegador:

```bash
http://localhost
```

Debes ver:
```bash
Versión actual: BLUE v1   (o GREEN v1)
```

# 🔄 5. Simular entornos Blue/Green localmente

El archivo que define la versión activa es:

```bash
app/current_version.txt
```

Puede contener:
```bash
BLUE

GREEN
```

El frontend leerá este valor y mostrará:
```bash
BLUE v1 (azul)

GREEN v1 (verde)
```

# 📁 6. Estructura del Proyecto
```bash
BLUE-GREEN-DEPLOY/
├─ api/
│  ├─ app.js
│  ├─ server.js
│  ├─ tests/
│  │   ├─ health.test.js
│  │   ├─ root.test.js
│  │   └─ version.test.js
│  └─ package.json
│
├─ app/
│  ├─ current_version.txt
│  └─ index.html
│
├─ nginx/
│  ├─ blue.conf
│  └─ green.conf
│
├─ scripts/
│  ├─ deploy_blue.sh
│  ├─ deploy_green.sh
│  ├─ switch_to_blue.sh
│  └─ switch_to_green.sh
│
├─ Dockerfile
└─ .github/workflows/blue-green.yml
```

# 🌐 7. Reverse Proxy con Nginx

Los archivos:
```bash
nginx/blue.conf
nginx/green.conf
```

Controlan cuál entorno (Blue o Green) recibe el tráfico.

Ejemplo:
```bash
location / {
    proxy_pass http://app-blue;
}
```

El script switch_to_blue.sh o switch_to_green.sh modifica el symlink activo en el VPS.

# 🚀 8. Despliegue automático (CI/CD)

Cada push a la rama main activa GitHub Actions:

Ejecuta pruebas Jest + Supertest ✔️

Construye la imagen Docker ✔️

Publica la imagen en Docker Hub ✔️

Se conecta por SSH al VPS ✔️

Despliega en el entorno opuesto (Blue o Green) ✔️

Cambia el tráfico vía Nginx sin downtime ✔️

Actualiza current_version.txt ✔️

Todo se controla desde:
```bash
.github/workflows/blue-green.yml
```

# 🧑‍💻 9. Endpoints disponibles (API)
Método	Ruta	Descripción
```bash
GET	/	Mensaje raíz
GET	/health	Estado de la API
GET	/version	Indica BLUE o GREEN activo
```
# 🧾 10. Contribuir
```bash
git checkout -b feature/nueva-funcion
git commit -m "Agrega nueva funcionalidad"
git push origin feature/nueva-funcion
```
