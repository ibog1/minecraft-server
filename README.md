# Minecraft Server 

This repository provides a self-built Docker image and a Docker Compose setup to run a **Minecraft Java Server**.
The server is exposed on **port 8888**.

## Table of Contents
- [Quickstart](#quickstart)
- [Usage](#usage)

---

## Quickstart 

### Prerequisites
- Docker
- Docker Compose

---

1. Clone the GitHub Project: 
  ```bash
  git clone git@github.com:ibog1/minecraft-server.git
  ```

2. Change into the project directory
  ```bash
  cd minecraft-server
  ```

3. Create the environment configuration file
  ```bash
  cp example.env .env
  ```
> [!NOTE]
> Edit the ``.env`` file and adjust the values according to your environment before starting the container.


4. Start the Minecraft server
  ```bash
  docker compose up -d --build
  ```

5. Check server logs
  ```bash
  docker compose logs -f mc-server
  ```

---

## Usage

### Dockerfile

The [`Dockerfile`](./Dockerfile) builds a custom Minecraft server image without using a prebuilt image.

> [!IMPORTANT]  
> A non-root user is used to improve container security.
> 
> The Minecraft server.jar is stored in /opt/mc and not in the mounted data directory
> 
> No secrets or credentials are hardcoded in the image
> 

---

## [`docker-compose.yaml`](./docker-compose.yaml)

> [!IMPORTANT]
> Port 8888 is exposed externally as required by the project.
>
> Data persistence is implemented using a **named Docker volume**.
>
> Runtime data is intentionally excluded from version control.
>
> Only non-sensitive configuration values should be defined here.


---

## [`entrypoint.sh`](./entrypoint.sh)

> [!IMPORTANT]
> The working directory is set to /data so configuration files are created in the persistent volume
> 
> The Minecraft EULA is accepted automatically via an environment variable
> 
> The server is started in a reproducible and automated way
>

---

### Persistence Test

#### 1. Create a test file inside the persistent volume

  ```bash
  docker compose exec mc-server sh -c 'echo persist-test > /data/persist.txt'
  ```

#### 2. Restart the container

  ```bash
  docker compose restart mc-server
  ```

#### 3. Verify that the file still exists

  ```bash
  docker compose exec mc-server cat /data/persist.txt
  ```

If ``persist-test`` is printed, persistence is successfully verified.



