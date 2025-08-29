# Microproyecto: Balanceo de Carga con HAProxy y Consul

## Descripción
Este microproyecto implementa un entorno distribuido donde se utiliza **HAProxy** como balanceador de carga y **Consul** como servicio de descubrimiento dinámico.  
En este entorno, se despliegan múltiples instancias de una aplicación Node.js en la máquina `clienteUbuntu`, y las peticiones se balancean a través de `servidorUbuntu`.

El objetivo es **garantizar tolerancia a fallos y distribución de carga automática**, además de evaluar el rendimiento con pruebas de carga utilizando **Artillery**.

---

## Arquitectura del Sistema
- **Servidor (servidorUbuntu)**
  - Consul Server
  - HAProxy (balanceador de carga)
- **Cliente (clienteUbuntu)**
  - Consul Client
  - 3 instancias de la aplicación Node.js (`web-3000`, `web-3001`, `web-3002`)

---

## Requerimientos
- [Vagrant](https://developer.hashicorp.com/vagrant)  
- [VirtualBox](https://www.virtualbox.org/)  
- Node.js (para ejecutar Artillery en el host)  
- Artillery (`npm install -g artillery`)  

---

## Cómo ejecutar el proyecto

1. **Clonar este repositorio**
   ```bash
   git clone https://github.com/daniel_munozji/microproyecto-balanceo.git
   cd microproyecto-balanceo
# 🌐 Microproyecto: Balanceo de Carga con HAProxy y Consul

## 📖 Descripción
Este microproyecto implementa un entorno distribuido donde se utiliza **HAProxy** como balanceador de carga y **Consul** como servicio de descubrimiento dinámico.  
En este entorno, se despliegan múltiples instancias de una aplicación Node.js en la máquina `clienteUbuntu`, y las peticiones se balancean a través de `servidorUbuntu`.

El objetivo es **garantizar tolerancia a fallos y distribución de carga automática**, además de evaluar el rendimiento con pruebas de carga utilizando **Artillery**.

---

## 🏗️ Arquitectura del Sistema
- **Servidor (servidorUbuntu)**
  - Consul Server
  - HAProxy (balanceador de carga)
- **Cliente (clienteUbuntu)**
  - Consul Client
  - 3 instancias de la aplicación Node.js (`web-3000`, `web-3001`, `web-3002`)

---

## ⚙️ Requerimientos
- [Vagrant](https://developer.hashicorp.com/vagrant)  
- [VirtualBox](https://www.virtualbox.org/)  
- Node.js (para ejecutar Artillery en el host)  
- Artillery (`npm install -g artillery`)  

---

##  Cómo ejecutar el proyecto

1. **Clonar este repositorio**
   ```bash
   git clone https://github.com/daniel_munozji/microproyecto-balanceo.git
   cd microproyecto-balanceo

## Pasos
Levantar las máquinas virtuales

vagrant up


Verificar el servidor Consul en servidorUbuntu

vagrant ssh servidorUbuntu
consul members


Levantar los servicios en clienteUbuntu

vagrant ssh clienteUbuntu
sudo systemctl start web-3000 web-3001 web-3002


Probar el balanceo desde el host

curl http://192.168.100.3/


👉 Las respuestas deben alternar entre:

Hello from clienteUbuntu on port 3000

Hello from clienteUbuntu on port 3001

Hello from clienteUbuntu on port 3002


## Pruebas de carga

Las pruebas se realizaron con Artillery, usando tres escenarios:

tests/load-test.yml → tráfico básico

tests/load-health.yml → prueba de salud

tests/load-failure.yml → simulación de fallo de instancia

Los reportes están disponibles en formato .json y .html.

Ejemplo para ejecutar un test:
artillery run tests/load-test.yml -o tests/report.json
npx artillery report tests/report.json

##Interfaces Web

HAProxy Stats: http://192.168.100.3:8080

Consul UI: http://192.168.100.3:8500/ui

Interfaces Web

HAProxy Stats: http://192.168.100.3:8080

Consul UI: http://192.168.100.3:8500/ui

Autor: Daniel Santiago Muñoz Jimenez