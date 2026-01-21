#!/usr/bin/env sh
set -eu

# Create/overwrite EULA file based on env (default: true)
echo "eula=${EULA:-true}" > /data/eula.txt

exec java -Xms"${XMS:-1G}" -Xmx"${XMX:-2G}" -jar /data/server.jar nogui
