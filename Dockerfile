FROM eclipse-temurin:21-jre
WORKDIR /data  # ← /data!

RUN apt-get update && apt-get install -y wget ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m minecraft \
    && mkdir -p /data \
    && chown -R minecraft:minecraft /data

USER minecraft
WORKDIR /data
RUN wget -O server.jar "https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar"

EXPOSE 25565/tcp
CMD ["java", "-Xms1G", "-Xmx2G", "-jar", "server.jar", "nogui"]  # ← /data/server.jar!
