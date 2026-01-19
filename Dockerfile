FROM eclipse-temurin:21-jre

ARG MINECRAFT_VERSION=1.21
ARG SERVER_JAR_URL=https://piston-data.mojang.com/v1/objects/e0e0cb74f9a8a34b6c0c958763b5e9cecb0e3c0c/server.jar
ENV SERVER_JAR_URL=${SERVER_JAR_URL}

WORKDIR /minecraft

RUN apt-get update && apt-get install -y wget ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m minecraft \
    && mkdir -p data \
    && chown -R minecraft:minecraft /minecraft

USER minecraft

RUN wget -O server.jar "${SERVER_JAR_URL}"

VOLUME ["/minecraft/data"]

EXPOSE 25565/tcp

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "server.jar", "nogui"]
