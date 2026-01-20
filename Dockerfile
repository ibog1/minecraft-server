FROM eclipse-temurin:21-jre

# Install minimal tooling for download + create non-root user
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl \
 && rm -rf /var/lib/apt/lists/* \
 && useradd -m -u 10001 minecraft

# Runtime dir (will be mounted via volume)
WORKDIR /data
RUN mkdir -p /data && chown -R minecraft:minecraft /data

# Default config (can be overridden via docker-compose)
ENV EULA=true \
    XMS=1G \
    XMX=2G

# Download server.jar (no prebuilt minecraft image)
ARG SERVER_JAR_URL="https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar"
RUN curl -fsSL "${SERVER_JAR_URL}" -o /data/server.jar \
 && chown minecraft:minecraft /data/server.jar

# Entrypoint creates eula.txt every start (so it always boots)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown minecraft:minecraft /entrypoint.sh

USER minecraft

EXPOSE 25565/tcp
ENTRYPOINT ["/entrypoint.sh"]
