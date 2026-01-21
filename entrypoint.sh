#!/usr/bin/env sh
set -eu

cd /data

echo "eula=${EULA:-true}" > eula.txt

# optional: server.properties erzeugen, damit der Fehler weg ist
if [ ! -f server.properties ]; then
  cat > server.properties <<EOF
server-port=${SERVER_PORT:-25565}
online-mode=${ONLINE_MODE:-true}
enable-query=${ENABLE_QUERY:-true}
query.port=${QUERY_PORT:-25565}
motd=${MOTD:-DevSecOps Server}
EOF
fi

exec java -Xms"${XMS:-1G}" -Xmx"${XMX:-2G}" -jar /opt/mc/server.jar nogui
