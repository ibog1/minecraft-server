#!/usr/bin/env sh
set -eu

echo "eula=${EULA:-true}" > /data/eula.txt

exec java -Xms"${XMS:-1G}" -Xmx"${XMX:-2G}" -jar /opt/mc/server.jar nogui
