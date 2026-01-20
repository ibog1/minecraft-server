FROM eclipse-temurin:21-jre

ARG MINECRAFT_VERSION=1.21
ARG SERVER_JAR_URL=https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar
ENV SERVER_JAR_URL=${SERVER_JAR_URL}

WORKDIR /minecraft

RUN apt-get update && apt-get install -y wget ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m minecraft \
    && mkdir -p data \
    && chown -R minecraft:minecraft /minecraft \
    && echo "eula=true" > eula.txt

USER minecraft

RUN wget -O server.jar "${SERVER_JAR_URL}"

EXPOSE 25565/tcp

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "server.jar", "nogui"]
