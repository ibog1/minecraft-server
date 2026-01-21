FROM eclipse-temurin:21-jre

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl \
 && rm -rf /var/lib/apt/lists/* \
 && useradd -m -u 10001 minecraft

# App dir (nicht gemountet)
WORKDIR /opt/mc
RUN mkdir -p /opt/mc && chown -R 10001:10001 /opt/mc

ARG SERVER_JAR_URL="https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar"
RUN curl -fsSL "${SERVER_JAR_URL}" -o /opt/mc/server.jar \
 && chown 10001:10001 /opt/mc/server.jar

# Data dir (wird gemountet)
RUN mkdir -p /data && chown -R 10001:10001 /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && chown 10001:10001 /entrypoint.sh

USER 10001

EXPOSE 25565/tcp
ENTRYPOINT ["/entrypoint.sh"]
