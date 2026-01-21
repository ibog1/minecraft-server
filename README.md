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
  yaml

  volumes:
  - ./data:/data

  ```
