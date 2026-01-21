# Minecraft Server 

This repository provides a self-built Docker image and a Docker Compose setup to run a **Minecraft Java Server**.
The server is exposed on **port 8888** and uses a mounted volume for persistent data storage.

## Table of Contents
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Repository Structure](#repository-structure)

---

## Quickstart 

### Requirements
- Docker
- Docker Compose

---

1. Clone the github Project: 
  ```bash
  git clone git@github.com:ibog1/minecraft-server.git
  ```

2. Change into the project directory
  ```bash
  cd minecraft-server
  ```

3. Start the Minecraft server
  ```bash
  docker compose up -d --build
  ```

4. Check server logs
  ```bash
  docker compose logs -f mc-server
  ```

---

## Usage

### Dockerfile

The `Dockerfile` builds a custom Minecraft server image without using a prebuilt image.

  ```bash

  FROM eclipse-temurin:21-jre

  RUN useradd -m -u 10001 minecraft

  WORKDIR /opt/mc
  RUN curl -fsSL "<SERVER_JAR_URL>" -o /opt/mc/server.jar

  USER 10001
  ```

> [!IMPORTANT]  
> A non-root user is used to improve container security.
> 
> The Minecraft server.jar is stored in /opt/mc and not in the mounted data directory
> 
> No secrets or credentials are hardcoded in the image
> 

---

## docker-compose.yaml

  ```bash
  yaml

  services:
  mc-server:
    ports:
      - "8888:25565"
    volumes:
      - ./data:/data
    restart: unless-stopped

  ```

> [!IMPORTANT]
> Port 8888 is exposed externally as required by the project
> The ./data:/data volume ensures data persistence
> Runtime data is intentionally excluded from version control
> Only non-sensitive configuration values should be defined here

---

## entrypoint.sh

  ```bash
  yaml

  cd /data
  echo "eula=${EULA:-true}" > eula.txt

  exec java -jar /opt/mc/server.jar nogui

  ```

> [!IMPORTANT]
> The working directory is set to /data so configuration files are created in the persistent volume
> The Minecraft EULA is accepted automatically via an environment variable
> The server is started in a reproducible and automated way


