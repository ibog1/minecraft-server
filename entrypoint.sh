#!/usr/bin/env sh
set -eu

cd /data

echo "eula=${EULA:-true}" > eula.txt

# optional: server.properties erzeugen, damit der Fehler weg ist
if [ ! -f server.properties ]; then
  cat > server.properties <<EOF
server-port=25565
online-mode=true
enable-query=true
query.port=25565
motd=DevSecOps Server
EOF
fi

exec java -Xms"${XMS:-1G}" -Xmx"${XMX:-2G}" -jar /opt/mc/server.jar nogui
