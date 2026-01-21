# Minecraft Server (Docker & Docker Compose)

This repository provides a self-built Docker image and a Docker Compose setup to run a **Minecraft Java Server**.
The server is exposed on **port 8888** and uses a mounted volume for persistent data storage.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Quickstart](#quickstart)
- [Usage](#usage)
- [Persistence](#persistence)
- [Testing](#testing)
- [Security Notes](#security-notes)
- [Important Notes](#important-notes)

---

## Quickstart 

### Requirements
- Docker
- Docker Compose

---

1. Clone the github Project: 
  ```bash
  git clone
  ```

2. Download your Minecraft Server from: 
  ```bash
  
  ```

3. Copy your Donwolad on your Root Directory of your Project. 
  ```bash
  cp server.jar ./Minecraft_Server
  ```

4. Navigate to the correct Directory: 
  ```bash
  cd minecraft-server
  ```

5. Start the Building with Docker Compose: 
  ```bash
  docker compose up --build 
  ```

---

## Repository Structure
